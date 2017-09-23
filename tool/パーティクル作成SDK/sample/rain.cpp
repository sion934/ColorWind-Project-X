/*********************************************************************
	Rain.cpp
			�p�[�e�B�N���v���O�C��
			�J

	param
		0 : �X�s�[�h
		1 : �p�x1
		2 : �p�x2

	�����p�x�͊p�x1����p�x2�̊ԂɂȂ�܂��B

	ex
	particle3 0 rain pt_rain 500 10000 31 50 -5 5
	
**********************************************************************/

#include "Rain.h"

#define	SAFE_FREE( p )	if(p!=NULL){ free(p); p=NULL; }


/********************************************
Global Function		MakeInstance
	�C���X�^���X�쐬
input  : void*	p
output : cs2ParticleTemplate*	�v���O�C���I�u�W�F�N�g
*********************************************/
__declspec(dllexport) cs2Particle* MakeInstance( void* p )
{
	return new cs2Particle( p );
}


/********************************************
Public Function		cs2Particle
	�R���X�g���N�^
input  :
output :
*********************************************/
cs2Particle::cs2Particle( void* p ) : cs2ParticleBase( p )
{
	lpDir = NULL;
}


/********************************************
Public Function		~cs2Particle
	�f�X�g���N�^
input  :
output :
*********************************************/
cs2Particle::~cs2Particle( )
{
	if( lpDir != NULL )
	{
		free( lpDir );
		lpDir = NULL;
	}
}


/********************************************
Public Function		Init
	������
input  :	LPINITPARAM	p	�������p�����[�^
output :
*********************************************/
void cs2Particle::Init( LPINITPARAM p )
{
	float* reg = p->param;

	if( lpDir == NULL )
	{
		// ���������m�ۂ���Ă��Ȃ��ꍇ�͊m��
		lpDir = (LPVEC3)malloc( p->count * sizeof(VEC3) );
	}

	if( lpDir != NULL )
	{
		for( DWORD i = 0; i < p->count; i++ )
		{
			// �����ʒu�̐ݒ�
			ResetPos( i, p->screen_width, p->screen_height, p->width, p->height );
			SetDir( i, reg[0], PPF->Deg2Rad(reg[1]), PPF->Deg2Rad(reg[2]) );
		}
	}
}


/********************************************
Public Function		Exec
	���s
input  :	LPEXECPARAM	p		���s�p�����[�^
			DWORD		before	�O����s���̃t���[���l
			DWORD		frame	�t���[���l
output :
*********************************************/
void cs2Particle::Exec( LPEXECPARAM p, DWORD before, DWORD frame )
{
	float	f;
	float*	reg;

	if( lpDir != NULL )
	{
		f = (float)(frame - before);
		reg = p->param;
		
		for( DWORD i = 0; i < p->count; i++ )
		{
			lpParticle[i].pos.x += lpDir[i].x * f;
			lpParticle[i].pos.y += lpDir[i].y * f;
			lpParticle[i].pos.z += lpDir[i].z * f;

			if( lpParticle[i].pos.y > p->screen_height + 200.f )
			{
				// ���܂ŗ������̂ŁA�ēx�ʒu��������
				ResetPos( i, p->screen_width, p->screen_height, p->width, p->height );
				SetDir( i, reg[0], PPF->Deg2Rad(reg[1]), PPF->Deg2Rad(reg[2]) );
			}
		}
	}
}


/********************************************
Public Function		Stop
	��~
input  :	LPSTOPPARAM	p	��~�p�����[�^
output :
*********************************************/
void cs2Particle::Stop( LPSTOPPARAM p )
{

}


/********************************************
Private Function		ResetPos
	�p�[�e�B�N���ʒu��������
input  :	long	no	����������p�[�e�B�N��No
			float	w	�X�N���[���̕�
			float	h	�X�N���[���̍���
			float	tx	�p�[�e�B�N���摜�̕�
			float	ty	�p�[�e�B�N���摜�̍���
output :
*********************************************/
void cs2Particle::ResetPos( long no, float w, float h, float tx, float ty )
{
	lpParticle[no].pos.x = PPF->frand( ) * w * 2.f - w * 0.5f;
	lpParticle[no].pos.y = -(PPF->frand( ) * h * 2.f);

	lpParticle[no].base.x = tx * 0.5f;
	lpParticle[no].base.y = ty * 0.5f;
}


/********************************************
Private Function		SetDir
	�p�[�e�B�N���ړ��������Z�b�g
input  :	long	no		�p�[�e�B�N��No
			float	spd		�X�s�[�h(�p�����[�^0)
			float	r1		�p�x1�i�p�����[�^1�j
			float	r2		�p�x2�i�p�����[�^2�j
output :	VEC3	�ړ��x�N�g��
*********************************************/
cs2Particle::VEC3 cs2Particle::SetDir( long no, float spd, float r1, float r2 )
{
	VEC3 v;
	float r;

	v.x = 0.f;
	v.y = spd;
	v.z = 0.f;

	r = PPF->frand( ) * (r2 - r1) + r1;
	PPF->VecRotateZ( &v, r );
	lpDir[no] = v;

	lpParticle[no].rot.z = -r;

	return v;
}
