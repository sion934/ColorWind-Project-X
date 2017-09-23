/*********************************************************************
	cs2ParticleBase.h
					�p�[�e�B�N���v���O�C�� ���N���X
**********************************************************************/
#pragma once

#include <windows.h>

#define CS2PARTICLEVERSION	(0x00020001)
#define	PLUGINTYPE	1

#define PI		(3.1415926535897932f)


class ParticlePluginFunc;
class ParticlePluginFunc21;

class cs2ParticleBase
{
public:
	// �������p�����[�^
	typedef struct
	{
		DWORD	count;		// �p�[�e�B�N����
		float	screen_width;	// ��ʂ̕�
		float	screen_height;	// ��ʂ̍���
		float	width;		// �p�[�e�B�N���摜�̕�
		float	height;		// �p�[�e�B�N���摜�̍���
		float	param[32];	// ���̓p�����[�^

	} INITPARAM, *LPINITPARAM;

	// ���s�p�����[�^
	typedef struct
	{
		DWORD	count;	// �p�[�e�B�N����
		float	screen_width;	// ��ʂ̕�
		float	screen_height;	// ��ʂ̍���
		float	width;		// �p�[�e�B�N���摜�̕�
		float	height;		// �p�[�e�B�N���摜�̍���
		float	param[32];	// ���̓p�����[�^

	} EXECPARAM, *LPEXECPARAM;

	// �I���i��~�j�p�����[�^
	typedef struct
	{
		DWORD	count;	// �p�[�e�B�N����
		float	screen_width;	// ��ʂ̕�
		float	screen_height;	// ��ʂ̍���
		float	width;		// �p�[�e�B�N���摜�̕�
		float	height;		// �p�[�e�B�N���摜�̍���
		float	param[32];	// ���̓p�����[�^

	} STOPPARAM, *LPSTOPPARAM;

	// �R���x�N�g��
	typedef union
	{
		struct
		{
			float	x, y, z;
		};
		float vec[3];
	} VEC3, *LPVEC3;

	// �Q���x�N�g��
	typedef union
	{
		struct
		{
			float	x, y;
		};
		struct
		{
			float	u, v;
		};
		float vec[2];
	} VEC2, *LPVEC2;

	// �F���
	typedef union
	{
		struct
		{
			BYTE	r, g, b, a;
		};
		DWORD	color;
	} COLOR, *LPCOLOR;

	// ���_���
	typedef struct
	{
		VEC3	v;
		COLOR	col;
		VEC2	tx;
	} VERTEX, *LPVERTEX;

	// �p�[�e�B�N�����
	typedef struct
	{
		VERTEX	p[4];
		VEC3	base;
		VEC3	pos;
		VEC3	rot;
		VEC3	scale;
		BOOL	disp;
	} PARTICLE, *LPPARTICLE;

	// �u�����h���[�h
	typedef enum
	{
		BM_NORM,	// �ʏ탂�[�h
		BM_ADD1,	// ���Z����1
		BM_ADD2,	// ���Z����2
		BM_MUL,		// ��Z����
		BM_INV,		// �]����J���[���]
		BM_DBL		// �]����J���[�Q�{
	} BLENDMODE;


protected:
	void* _P;

public:
	cs2ParticleBase( void* p );
	virtual ~cs2ParticleBase( );

	virtual void Init( LPINITPARAM p ) = NULL;
	virtual void Exec( LPEXECPARAM p, DWORD before, DWORD frame ) = NULL;
	virtual void Stop( LPSTOPPARAM p ) = NULL;

public:
	ParticlePluginFunc21*	PPF;

	LPPARTICLE	lpParticle;
	BLENDMODE	BlendMode;

	LONG		nAttachPL;
	VEC3		vAttachPLBase;
	VEC3		vAttachPLPos;
	BOOL		bAttachPLDisp;
};


////////////////////////////////////////
// Ver 2.0 �`
class ParticlePluginFunc
{
private:

public:
	ParticlePluginFunc( );

	// �S�ʌn
	virtual void GetScreenSize( void* p, DWORD* width, DWORD* height );	// �X�N���[���̕��ƍ������擾
	virtual void Exit( void* p );

	// ����
	virtual DWORD rand( void );		// �����l�擾 (0�`0xffffffff)
	virtual float frand( void );	// �����l�擾 (0.0�`1.0)

	// �x�̃��W�A���ϊ�
	virtual float Deg2Rad( float d );	// �x�����W�A��
	virtual float Rad2Deg( float r );	// ���W�A�����x

	// �Z�p�֐�
	virtual float sin( float r );
	virtual float cos( float r );
	virtual float tan( float r );
	virtual float asin( float r );
	virtual float acos( float r );
	virtual float atan( float r );
	virtual float atan2( float y, float x );
	virtual float ceil( float f );
	virtual float fabs( float f );
	virtual float floor( float f );
	virtual float fmod( float a, float b );
	virtual float sqrt( float f );
	virtual float pow( float a, float b );
	virtual long abs( long n );
	virtual long round( float f );


	// �x�N�g���֐�
	virtual void VecRotateX( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecRotateY( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecRotateZ( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecRotateXYZ( cs2ParticleBase::LPVEC3 v, float r );
	virtual void VecTrans( cs2ParticleBase::LPVEC3 v, float x, float y, float z );
	virtual void VecScale( cs2ParticleBase::LPVEC3 v, float x, float y, float z );
	virtual float VecGetDistance( cs2ParticleBase::LPVEC3 v1, cs2ParticleBase::LPVEC3 v2 );
	virtual void VecNormalize( cs2ParticleBase::LPVEC3 v );

	// ���̑�
	virtual float LinearInt( float area_min, float area_max, float in_min, float in_max, float n );
	virtual float TriWave( float n, float r );

};


////////////////////////////////////////
// Ver 2.1 �`
class ParticlePluginFunc21 : public ParticlePluginFunc
{
public:
	virtual VOID SetZShift( void* __lpp, INT no, FLOAT zs );
};



