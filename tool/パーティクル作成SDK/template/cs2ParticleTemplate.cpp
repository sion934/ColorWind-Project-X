/*********************************************************************
	cs2ParticleTemplate.cpp
			�p�[�e�B�N���v���O�C���e���v���[�g


**********************************************************************/

#include "cs2ParticleTemplate.h"


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

}


/********************************************
Public Function		~cs2Particle
	�f�X�g���N�^
input  :
output :
*********************************************/
cs2Particle::~cs2Particle( )
{

}


/********************************************
Public Function		Init
	������
input  :	LPINITPARAM	p	�������p�����[�^
output :
*********************************************/
void cs2Particle::Init( LPINITPARAM p )
{

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
