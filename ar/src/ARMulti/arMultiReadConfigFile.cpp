/*******************************************************
 *
 * Author: Hirokazu Kato
 *
 *         kato@sys.im.hiroshima-cu.ac.jp
 *
 * Revision: 1.0
 * Date: 01/09/05
 *
*******************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <AR/ar.h>
#include <AR/matrix.h>
#include <AR/arMulti.h>
#include <string>


static char *get_buff( char *buf, int n, FILE *fp )
{
    while(true) {
        char *ret = fgets( buf, n, fp );
        if(ret==NULL){
            return NULL ;
        }
        switch(buf[0]){
            case '\n':
            case '#':
                // skip
                continue;
        }
        return ret;
    }
    return NULL;
}

static std::string getdir(const std::string &path)
{
    auto pos=path.rfind("/");
    if(pos==std::string::npos){
        return path;
    }
    return path.substr(0, pos);
}


ARMultiMarkerInfoT *arMultiReadConfigFile( const char *filename )
{
    FILE *fp=fopen(filename,"r");
    if(fp == NULL){
        return NULL;
    }

    char buf[256];
    get_buff(buf, 256, fp);

    int num;
    if( sscanf(buf, "%d", &num) != 1 ) {
        fclose(fp); return NULL;
    }

    ARMultiEachMarkerInfoT *marker;
    ARMultiMarkerInfoT     *marker_info;
    arMalloc(marker,ARMultiEachMarkerInfoT,num);

    std::string dir=getdir(filename);

    for(int i = 0; i < num; i++ ) {
        get_buff(buf, 256, fp);
        char buf1[256];
        if( sscanf(buf, "%s", buf1) != 1 ) {
            fclose(fp); free(marker); return NULL;
        }
        if( (marker[i].patt_id = arLoadPatt((dir+"/"+buf1).c_str())) < 0 ) {
            fclose(fp); free(marker); return NULL;
        }

        get_buff(buf, 256, fp);
        if( sscanf(buf, "%lf", &marker[i].width) != 1 ) {
            fclose(fp); free(marker); return NULL;
        }

        get_buff(buf, 256, fp);
        if( sscanf(buf, "%lf %lf", &marker[i].center[0], &marker[i].center[1]) != 2 ) {
            fclose(fp); free(marker); return NULL;
        }

        for(int j = 0; j < 3; j++ ) {
            get_buff(buf, 256, fp);
            if( sscanf(buf, "%lf %lf %lf %lf", &marker[i].trans[j][0],
                       &marker[i].trans[j][1], &marker[i].trans[j][2],
                       &marker[i].trans[j][3]) != 4 ) {
                fclose(fp); free(marker); return NULL;
            }
        }
        arUtilMatInv( marker[i].trans, marker[i].itrans );

        double wpos3d[4][2];
        wpos3d[0][0] = marker[i].center[0] - marker[i].width/2.0;
        wpos3d[0][1] = marker[i].center[1] + marker[i].width/2.0;
        wpos3d[1][0] = marker[i].center[0] + marker[i].width/2.0;
        wpos3d[1][1] = marker[i].center[1] + marker[i].width/2.0;
        wpos3d[2][0] = marker[i].center[0] + marker[i].width/2.0;
        wpos3d[2][1] = marker[i].center[1] - marker[i].width/2.0;
        wpos3d[3][0] = marker[i].center[0] - marker[i].width/2.0;
        wpos3d[3][1] = marker[i].center[1] - marker[i].width/2.0;
        for(int j = 0; j < 4; j++ ) {
            marker[i].pos3d[j][0] = marker[i].trans[0][0] * wpos3d[j][0]
                                  + marker[i].trans[0][1] * wpos3d[j][1]
                                  + marker[i].trans[0][3];
            marker[i].pos3d[j][1] = marker[i].trans[1][0] * wpos3d[j][0]
                                  + marker[i].trans[1][1] * wpos3d[j][1]
                                  + marker[i].trans[1][3];
            marker[i].pos3d[j][2] = marker[i].trans[2][0] * wpos3d[j][0]
                                  + marker[i].trans[2][1] * wpos3d[j][1]
                                  + marker[i].trans[2][3];
        }
    }

    fclose(fp);

    marker_info = (ARMultiMarkerInfoT *)malloc( sizeof(ARMultiMarkerInfoT) );
    if( marker_info == NULL ) {free(marker); return NULL;}
    marker_info->marker     = marker;
    marker_info->marker_num = num;
    marker_info->prevF      = 0;

    return marker_info;
}


