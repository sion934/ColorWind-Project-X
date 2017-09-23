;;----------------------------------------------------------------------
;; E-mote�v���C���[������
;;----------------------------------------------------------------------
[call storage="emoteplayer.ks"]
[emoteenv meshdivisionratio=0.5 bustscale=1 hairscale=1 partsscale=1]
[image storage="snow_bg" page=fore layer=base]
[position layer=message1 page=fore left=16 top=416 width=768 height=168 marginl=8 margint=8 marginr=8 marginb=8 visible=true]

;;----------------------------------------------------------------------
;; �}�N���ݒ�
;;----------------------------------------------------------------------
[macro name=begintag]
[current layer=message1]
[nowait]
[endmacro]

[macro name=endtag]
[current layer=message0]
[endnowait]
[endmacro]

[macro name=em]
[font color=0xFF8080]
[endmacro]

[macro name=endem]
[resetfont]
[endmacro]

;;----------------------------------------------------------------------
;; �I�����
;;----------------------------------------------------------------------
*start|�ꗗ

[cm]
[nowait]
E-mote for KAG ����[r]
[link storage=tutorial1.ks](1) E-mote�̊�{[endlink][r]
[link storage=tutorial2.ks](2) �����̕ύX[endlink][r]
[link storage=tutorial3.ks](3) �L�����̑O��֌W[endlink][r]
[link storage=tutorial4.ks](4) �ϐ��l�̐ݒ�[endlink][r]
[link storage=tutorial5.ks](5) �^�C�����C���̍Đ�[endlink][r]
[link storage=tutorial6.ks](6) ����ʂ̊��p[endlink][r]
[link storage=tutorial7.ks](7) �{�C�X�Ƃ̓���[endlink][r]
[link storage=tutorial8.ks](8) ���ݒ�[endlink][r]
[link storage=etc.ks](ex) ���̑��̒��ӓ_[endlink][r]
[if exp="emote_get_d3d_available()"]
[if exp="sf.emote_used3d==0"]
[link target=*d3d_on]Direct3D�`��(�I��/*�I�t)[endlink]
[else]
[link target=*d3d_off]Direct3D�`��(*�I��/�I�t)[endlink]
[endif]
[endif]
[endnowait]
[s]

*d3d_on|
[emoteenv used3d=1]
[jump target=*start]

*d3d_off|
[emoteenv used3d=0]
[jump target=*start]

