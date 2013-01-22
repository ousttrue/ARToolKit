/*******************************************************
 *
 * Author: Shinsaku Hiura, Hirokazu Kato
 *
 *         shinsaku@sys.es.osaka-u.ac.jp
 *         kato@sys.im.hiroshima-cu.ac.jp
 *
 * Revision: 2.1
 * Date: 99/07/16
 *
*******************************************************/
#include <stdio.h>
#include <math.h>
#include <AR/matrix.h>

AR_DLL_API int arMatrixInv(ARMat *dest, ARMat *source)
{
	if(arMatrixDup(dest, source) < 0) return -1;

	return arMatrixSelfInv(dest);
}
