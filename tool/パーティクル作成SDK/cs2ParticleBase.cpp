/*********************************************************************
	cs2ParticleBase.cpp
					�p�[�e�B�N���v���O�C�� ���N���X
**********************************************************************/

#include "cs2ParticleBase.h"


ParticlePluginFunc*	PPF = NULL;


/********************************************
Public Function		ReleaseInstance
	�C���X�^���X�J��
input  : cs2ParticleBase*	c	�v���O�C���I�u�W�F�N�g
output :
*********************************************/
__declspec(dllexport) void ReleaseInstance( cs2ParticleBase* c )
{
	if( c != NULL )	delete c;
}


/********************************************
Public Function		GetPluginVersion
	�v���O�C���o�[�W�����擾
input  : 
output : DWORD	�o�[�W����No
*********************************************/
__declspec(dllexport) DWORD GetPluginVersion( void )
{
	return CS2PARTICLEVERSION;
}


/********************************************
Public Function		GetPluginType
	�v���O�C���^�C�v�擾
input  : 
output : DWORD	�^�C�vNo
*********************************************/
__declspec(dllexport) DWORD GetPluginType( void )
{
	return PLUGINTYPE;
}



/********************************************
Public Function		cs2ParticleBase
	�R���X�g���N�^
input  :	void* p
output :
*********************************************/
cs2ParticleBase::cs2ParticleBase( void* p )
{
	_P = p;
	lpParticle = NULL;
	BlendMode = BM_NORM;
}


/********************************************
Public Function		~cs2ParticleBase
	�f�X�g���N�^
input  :
output :
*********************************************/
cs2ParticleBase::~cs2ParticleBase( )
{

}


