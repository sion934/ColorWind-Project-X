@loadplugin module="emoteplayer.dll"

;
; E-mote�̃��\�[�X�}�l�[�W���[�̃L���b�V���T�C�Y�̓f�t�H���g�ł�20MB�B
; ���̗e�ʂ܂ł́A�P�x�ǂ񂾃t�@�C������������ɃL���b�V������B
; Config.tjs �� �u�E�B���h�E�⓮��̒ǉ��̐ݒ�v �Ɉȉ��̎w���ǉ����邱�Ƃ�
; �L���b�V���̒l��C�ӂ̃T�C�Y�ɐݒ�o����B
; [start-window-additionals]
; emoteCacheSize = 20 * 1024 * 1024;
; [end-window-additionals]
;
;
; �ȉ��̃^�O���g�������B���ʓ��͏ȗ����̏����l
;
; @emoteenv
;   E-mtoe�̊��ݒ���s��
;   meshdivisionratio(1): ���b�V���������B�V�X�e���ϐ� sf.emote_meshdivisionratio �ɐݒ�l���ۑ������B
;   bustscale(1): ���h��X�P�[���B�V�X�e���ϐ� sf.emote_bustscale �ɐݒ�l���ۑ������B
;   hairscale(1): ���h��X�P�[���B�V�X�e���ϐ� sf.emote_hairscale �ɐݒ�l���ۑ������B
;   partsscale(1): �p�[�c�h��X�P�[���B�V�X�e���ϐ� sf.emote_partsscale �ɐݒ�l���ۑ������B
;   used3d(0): �`��ւ�D3D�g�p�B�V�X�e���ϐ� sf.emote_used3d �ɐݒ�l���ۑ������B
;
; @emotestart
;   E-mote�̍Đ����J�n����
;   seg: �Đ�����Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   storage: E-mote�L�����̃X�g���[�W���w��
;   visible(true): ���E�s��
;   index(0): �Đ����郌�C���̏d�ˍ��킹����
;   xofs(0): X�I�t�Z�b�g
;   yofs(0): Y�I�t�Z�b�g
;   rot(0): �p�x�B360�x�n�ŉE���B
;   zoom(1): �Y�[��
;   color(0x808080): DIFFUSE�J���[�B0xRRGGBB�`���B80�������F�ŁA�����菬�����ƈÂ��A�傫���Ɩ��邭�Ȃ�B
;   speed(1): �Đ�����X�s�[�h���w��
;   meshdivisionratio(1): ���b�V��������(���ݒ�l�Ƃ̐ώZ)
;   bustscale(1): ���h��X�P�[��(���ݒ�l�Ƃ̐ώZ)
;   hairscale(1): ���h��X�P�[��(���ݒ�l�Ƃ̐ώZ)
;   partsscale(1): �p�[�c�h��X�P�[��(���ݒ�l�Ƃ̐ώZ)
;   
; @emotestop
;   E-mote�̍Đ����~����
;   seg: ��~����Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;
; @emoteopt
;   E-mote�̃I�v�V������ύX����
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   storage: E-mote�L�����̃X�g���[�W���w��
;   visible: ���E�s��
;   index: �Đ����郌�C���̏d�ˍ��킹����
;   xofs: X�I�t�Z�b�g
;   yofs: Y�I�t�Z�b�g
;   rot: �p�x�B360�x�n�ŉE���B
;   zoom: �Y�[��
;   color: DIFFUSE�J���[�B0xRRGGBB�`���B80�������F�ŁA�����菬�����ƈÂ��A�傫���Ɩ��邭�Ȃ�B
;   speed: �Đ�����X�s�[�h���w��
;   meshdivisionratio: ���b�V��������(���ݒ�l�Ƃ̐ώZ)
;   bustscale: ���h��X�P�[��(���ݒ�l�Ƃ̐ώZ)
;   hairscale: ���h��X�P�[��(���ݒ�l�Ƃ̐ώZ)
;   partsscale: �p�[�c�h��X�P�[��(���ݒ�l�Ƃ̐ώZ)
;   time(0): �I�v�V�����J�ڂ̎���(ms�P��)
;   easing(0): �I�v�V�����J�ڂ̃C�[�W���O�������l�Ŏw��B���̒l�Ȃ�C�[�Y�C���A���̒l�Ȃ�C�[�Y�A�E�g�B
;   skip(false): �����ݒ��A�X�L�b�v�������s���B
;
; @emotewait
;   E-mote�̃A�j���[�V����������҂�
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   canskip(true): �E�G�C�g���X�L�b�v�o���邩�ǂ���
;
; @emotevariable
;   E-mote�̕ϐ����w�肷��
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   name: �ϐ��̖��O
;   value: �ϐ��̒l
;   time(0): �ϐ��J�ڂ̎���(ms�P��)
;   easing(0): �ϐ��J�ڂ̃C�[�W���O�������l�Ŏw��B���̒l�Ȃ�C�[�Y�C���A���̒l�Ȃ�C�[�Y�A�E�g�B
;   storage: �ϐ��̒l���J���}��؂�̃e�L�X�g�t�@�C������ǂݍ��ށB
;   fps(60): storage�w��������ۂɐ��l1��1�b�Ԃ̂������Ƃ݂Ȃ����B
;   buf: �ϐ��̒l��SE�̍Đ��o�b�t�@����擾����B(getSample.dll�̓o�^���K�v)
;   skip(false): �ݒ��A�X�L�b�v�������s���B
;
; @emoteplaytimeline
;   E-mote�̃^�C�����C�����Đ�����
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   name: �^�C�����C���̖��O
;
; @emotestoptimeline
;   E-mote�̃^�C�����C�����~����
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   name: �^�C�����C���̖��O
;
; @emotefadeintimeline
;   �����^�C�����C�����t�F�[�h�C��������
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   name: �^�C�����C���̖��O
;   time(0): �J�ڂ̎���(ms�P��)
;   easing(0): �J�ڂ̃C�[�W���O�������l�Ŏw��B���̒l�Ȃ�C�[�Y�C���A���̒l�Ȃ�C�[�Y�A�E�g�B
;
; @emotefadeouttimeline
;   �����^�C�����C�����t�F�[�h�A�E�g������
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   name: �^�C�����C���̖��O
;   time(0): �J�ڂ̎���(ms�P��)
;   easing(0): �J�ڂ̃C�[�W���O�������l�Ŏw��B���̒l�Ȃ�C�[�Y�C���A���̒l�Ȃ�C�[�Y�A�E�g�B
;
; @emotefadetimeline
;   �����^�C�����C���̃u�����h�����t�F�[�h������
;   seg: �Z�O�����g���w��(0�ȏ�̐���)
;   page(fore): �\��ʂ��Ώۂ�����ʂ��Ώۂ�
;   name: �^�C�����C���̖��O
;   ratio: �u�����h�䗦�B�W���l��1�B
;   time(0): �J�ڂ̎���(ms�P��)
;   easing(0): �J�ڂ̃C�[�W���O�������l�Ŏw��B���̒l�Ȃ�C�[�Y�C���A���̒l�Ȃ�C�[�Y�A�E�g�B
;
               

@if exp="typeof(global.emote_player_object) == 'undefined'"
@iscript

// ���ϐ��̏�����
if (typeof(sf["emote_meshdivisionratio"]) == "undefined")
  sf["emote_meshdivisionratio"] = 1.0;
if (typeof(sf["emote_hairscale"]) == "undefined")
  sf["emote_hairscale"] = 1.0;
if (typeof(sf["emote_bustscale"]) == "undefined")
  sf["emote_bustscale"] = 1.0;
if (typeof(sf["emote_partsscale"]) == "undefined")
  sf["emote_partsscale"] = 1.0;
if (typeof(sf["emote_used3d"]) == "undefined")
  sf["emote_used3d"] = 0;

/**
 * ���[�e�B���e�B�֐�
 */
function emote_get_d3d_available()
{
  return Motion.getD3DAvailable();
}

/**
 * E-mote���\�[�X�}�l�[�W���[
 */
class EmoteResourceManager
 {
   var resourceManager;
   var refCount = %[];

   function EmoteResourceManager {
     resourceManager = 
       new Motion.ResourceManager(kag, 
                                  typeof(kag["emoteCacheSize"]) == "undefined" 
                                  ? 20 * 1024 * 1024
                                  : kag.emoteCacheSize);
   }

   function finalize {
     invalidate resourceManager;
   }

   function load(path) {
     if (typeof(refCount[path]) == "undefined") {
       refCount[path] = 1;
     } else {
       refCount[path]++;
     }
     var data = resourceManager.load(path);
     return data;
   }

   function unload(path) {
     if (--refCount[path] <= 0) {
       delete refCount[path];
       resourceManager.unload(path);
     }
   }
};

kag.add(global.emote_manager = new EmoteResourceManager());


// backlay���AonCopyLayer(true)���Ă΂��B
// �g�����W�V�����������AonCopyLayer(false), onExchangeForeBack() ���Ă΂��B


/**
 * ���[�V�������C��
 */
class EmotePlayer
{
  var motionPlayer;
  var forePlayer, backPlayer;
  var foreAdaptor, backAdaptor;
  var foreParam, backParam;
  var variableStreamInfoList = [];

  function EmotePlayer(foreLayer, backLayer) {
    foreAdaptor = new Motion.SeparateLayerAdaptor(foreLayer);
    backAdaptor = new Motion.SeparateLayerAdaptor(backLayer);
    forePlayer = backPlayer = newPlayer();
    foreParam = initialLayerParam();
    backParam = initialLayerParam();
  }

  function finalize {
    if (foreParam.storage !== void) 
      emote_manager.unload(foreParam.storage);
    if (forePlayer !== backPlayer)
      if (backParam.storage !== void) 
        emote_manager.unload(backParam.storage);
    invalidate forePlayer;
    invalidate backPlayer;
    invalidate backAdaptor;
    invalidate foreAdaptor;
  }

  function initialLayerParam {
    return %[ visible: true,
              index: 0,
              xofs: 0,
              yofs: 0,
              storage: void,
              speed: 1,
              rot: 0,
              zoom: 1.0,
              speed: 1,
              rot: 0,
              zoom: 1.0,
              color: 0x808080,
              stop: false,
              meshDivisionRatio: 1,
              hairScale: 1,
              bustScale: 1,
              partsScale: 1,           
              ];
  }

  function newPlayer() {
    var player = new Motion.EmotePlayer(emote_manager.resourceManager);
    player.setCameraOffset(kag.scWidth / 2, kag.scHeight / 2);
    player.completionType = stFastLinear;
    player.maskMode = Motion.MaskModeAlpha;
    return player;
  }


  function dividePlayer() {
    if (forePlayer !== backPlayer)
      return false;
    backPlayer = newPlayer();
    if (backParam.storage !== void) {
      var curData = emote_manager.load(backParam.storage);
      backPlayer.motionKey = Storages.getPlacedPath(backParam.storage);
      backPlayer.chara = curData.metadata.base.chara;
      backPlayer.play(curData.metadata.base.motion, Motion.PlayFlagForce);
      backPlayer.initPhysics(curData.metadata);
      backPlayer.unserialize(forePlayer.serialize());
    }
    return true;
  }

  function applyOpt(mp) {
    var page = mp["page"] == "back" ? "back" : "fore";
    var prevParam;
    var newParam = %[];
    var time = +mp.time * 60 / 1000;
    var easing = +mp.easing;
    var player;

    if (page == "fore") {
      prevParam = foreParam;
      player = forePlayer;
    } else  {
      if (dividePlayer()) {
        prevParam = backParam;
        (Dictionary.assign incontextof prevParam)(foreParam);
      } else {
        prevParam = backParam;
      }
      player = backPlayer;
    }

    (Dictionary.assign incontextof newParam)(prevParam);

    if (typeof(mp["index"]) != "undefined") {
      newParam.index = +mp.index;
    }
    if (typeof(mp["stop"]) != "undefined") 
      newParam.stop = +mp.stop;
    else
      newParam.stop = false;
    if (typeof(mp["visible"]) != "undefined") 
      newParam.visible = +mp.visible;
    if (typeof(mp["xofs"]) != "undefined") 
      newParam.xofs = +mp.xofs;
    if (typeof(mp["yofs"]) != "undefined") 
      newParam.yofs = +mp.yofs;
    if (typeof(mp["storage"]) != "undefined") 
      newParam.storage = mp.storage;
    if (typeof(mp["speed"]) != "undefined") 
      newParam.speed = +mp.speed;
    if (typeof(mp["rot"]) != "undefined") 
      newParam.rot = +mp.rot;
    if (typeof(mp["zoom"]) != "undefined") 
      newParam.zoom = +mp.zoom;
    if (typeof(mp["color"]) != "undefined") 
      newParam.color = +mp.color;
    if (typeof(mp["meshdivisionratio"]) != "undefined")
      newParam.meshDivisionRatio = +mp["meshdivisionratio"];
    if (typeof(mp["bustscale"]) != "undefined")
      newParam.bustScale = +mp["bustscale"];
    if (typeof(mp["hairscale"]) != "undefined")
      newParam.hairScale = +mp["hairscale"];
    if (typeof(mp["partsscale"]) != "undefined")
      newParam.partsScale = +mp["partsscale"];

    applyNewParam(player, prevParam, newParam, time, easing);
    if (+mp.skip)
      player.skip();
  }

  function applyNewParam(player, prevParam, newParam, time = 0, easing = 0) {
    time = time / newParam.speed;
    if (newParam.storage != prevParam.storage) {
      if (newParam.storage !== void) {
        var curState = player.serialize();
        var curData = emote_manager.load(newParam.storage);
        player.motionKey = Storages.getPlacedPath(newParam.storage);
        player.chara = curData.metadata.base.chara;
        player.play(curData.metadata.base.motion, Motion.PlayFlagForce);
        player.initPhysics(curData.metadata);
        player.unserialize(curState);
      }
      if (prevParam.storage !== void) 
        emote_manager.unload(prevParam.storage);
    }
    if (newParam.xofs !== prevParam.xofs
        || newParam.yofs !== prevParam.yofs) {
      player.setCoord(newParam.xofs, newParam.yofs, time, easing);
    }
    if (newParam.rot !== prevParam.rot) {
      player.setRotate(newParam.rot * Math.PI * 2 / 360, time, easing);
    }
    if (newParam.zoom !== prevParam.zoom) {
      player.setScale(newParam.zoom, time, easing);
    }
    if (newParam.color !== prevParam.color) {
      player.setColor(0xFF000000 | newParam.color, time, easing);
    }
    (Dictionary.assign incontextof prevParam)(newParam);
  }

  function removeVaraibleStream(name) {
    for (var i = 0; i < variableStreamInfoList.count; i++) {
      var info = variableStreamInfoList[i];
      if (info.name == name) {
        variableStreamInfoList.erase(i);
        break;
      }
    }
  }

  function newVariableStreamSrcText(name, storage, fps) {
    var data = [];
    data.load(storage);
    data = data.join(",").split(/,/);
    for (var i = 0; i < data.count; i++)
      data[i] = +data[i].trim();
    var info = %[ name: name,
                  src: "text",
                  fps: fps,
                  count: void,
                  data: data ];
    variableStreamInfoList.add(info);
  }

  function newVariableStreamSrcSe(name, buf) {
    var range = forePlayer.getVariableRange(name);
    if (range === void) {
      range = backPlayer.getVariableRange(name);
      if (range === void) 
        return;
    }
    if (buf < 0 || buf >= kag.numSEBuffers)
      return;
    var info = %[ name: name,
                  prevValue: 0,
                  src: "se",
                  buf: buf,
                  min: range.min,
                  max: range.max ];
    variableStreamInfoList.add(info);
  }

  function applyVariable(mp) {
    var player;
    var param;
    if (typeof(mp["storage"]) !== "undefined") {
      var name = mp.name;
      var fps = typeof(mp["fps"]) == "undefined" ? 60 : +mp["fps"];
      removeVaraibleStream(name);
      newVariableStreamSrcText(name, mp.storage, fps);
    } else if (typeof(mp["buf"]) !== "undefined") {
      var name = mp.name;
      var buf = int(mp["buf"]);
      removeVaraibleStream(name);
      newVariableStreamSrcSe(name, buf);
    } else {
      if (mp["page"] != "back") {
        player = forePlayer;
        param = foreParam;
      } else {
        dividePlayer();
        player = backPlayer;
        param = backParam;
      }
      var name = mp.name;
      var value = +mp.value;
      var time = +mp.time * 60 / 1000 / param.speed;
      var easing = +mp.easing;
      player.setVariable(name, value, time, easing);
      removeVaraibleStream(name);
    } 
    if (+mp.skip)
      player.skip();
  }
  
  function playTimeline(mp) {
    var player;
    if (mp["page"] != "back") {
      player = forePlayer;
    } else {
      dividePlayer();
      player = backPlayer;
    }
    var name = mp.name;
    var flags = 0;
    if (player.getMainTimelineLabelList().find(name) >= 0)
      flags = global.Motion.EmotePlayer.TimelinePlayFlagParallel;
    else if (player.getDiffTimelineLabelList().find(name) >= 0)
      flags = global.Motion.EmotePlayer.TimelinePlayFlagParallel | global.Motion.EmotePlayer.TimelinePlayFlagDifference;
    else
      return;
    player.playTimeline(name, flags);
  }

  function stopTimeline(mp) {
    var player;
    if (mp["page"] != "back") {
      player = forePlayer;
    } else {
      dividePlayer();
      player = backPlayer;
    }
    var name = mp.name;
    player.stopTimeline(name);
  }

  function fadeinTimeline(mp) {
    var player;
    var param;
    if (mp["page"] != "back") {
      player = forePlayer;
      param = foreParam;
    } else {
      dividePlayer();
      player = backPlayer;
      param = backParam;
    }
    var name = mp.name;
    if (player.getDiffTimelineLabelList().find(name) < 0)
      return;
    var time = +mp.time * 60 / 1000 / param.speed;
    var easing = +mp.easing;
    player.fadeInTimeline(name, time, easing);
  }

  function fadeoutTimeline(mp) {
    var player;
    var param;
    if (mp["page"] != "back") {
      player = forePlayer;
      param = foreParam;
    } else {
      dividePlayer();
      player = backPlayer;
      param = backParam;
    }
    var name = mp.name;
    if (player.getDiffTimelineLabelList().find(name) < 0)
      return;
    var time = +mp.time * 60 / 1000 / param.speed;
    var easing = +mp.easing;
    player.fadeOutTimeline(name, time, easing);
  }

  function fadeTimeline(mp) {
    var player;
    var param;
    if (mp["page"] != "back") {
      player = forePlayer;
      param = foreParam;
    } else {
      dividePlayer();
      player = backPlayer;
      param = backParam;
    }
    var name = mp.name;
    if (player.getDiffTimelineLabelList().find(name) < 0)
      return;
    var ratio = +mp.ratio;
    var time = +mp.time * 60 / 1000 / param.speed;
    var easing = +mp.easing;
    player.setTimelineBlendRatio(name, ratio, time, easing);
  }

  function skip() {
    forePlayer.skip();
    if (forePlayer !== backPlayer)
      backPlayer.skip();
  }

  property animating {
    getter {
      if (variableStreamInfoList.count)
        return true;
      if (forePlayer === backPlayer)
        return forePlayer.animating;
      else
        return forePlayer.animating || backPlayer.animating;
    }
  }

  function invalidateScale(player, param) {
    player.meshDivisionRatio = param.meshDivisionRatio * +sf["emote_meshdivisionratio"];
    player.hairScale = param.hairScale * +sf["emote_hairscale"];
    player.bustScale = param.bustScale * +sf["emote_bustscale"];
    player.partsScale = param.partsScale * +sf["emote_partsscale"]; 
  }
  
  function onTick(diffTick) {
    for (var i = 0; i < variableStreamInfoList.count; i++) {
      var info = variableStreamInfoList[i];
      var value = 0;
      var done = false;
      switch (info.src) {
      case "text": {
        if (info.count === void)
          info.count = 0;
        else
          info.count += diffTick / 1000 * info.fps;
        if (int(info.count) >= info.data.count) {
          done = true;
        } else {
          value = +(info.data[int(info.count)]);
        }
        break;
      }
      case "se": {
        if (kag.se[info.buf].status != "play") {
          done = true;
        } else {
          var curValue = info.min + (info.max - info.min) * kag.se[info.buf].sampleValue;
          var ratio = Math.pow(diffTick / 1000, 1/10);
          value = curValue * (1 - ratio) + info.prevValue * ratio;
          info.prevValue = value;
        }
        break;
      }
      }

      forePlayer.setVariable(info.name, value);
      if (forePlayer !== backPlayer)
        backPlayer.setVariable(info.name, value);

      if (done) {
        variableStreamInfoList.erase(i);
        i--;
      }
    }

    invalidateScale(forePlayer, foreParam);
    forePlayer.useD3D = sf.emote_used3d;
    forePlayer.progress(diffTick * foreParam.speed);
    if (forePlayer !== backPlayer) {
      invalidateScale(backPlayer, backParam);
      backPlayer.useD3D = sf.emote_used3d;
      backPlayer.progress(diffTick * backParam.speed);
    }
    foreAdaptor.absolute = foreParam.index;
    backAdaptor.absolute = backParam.index;

    if (foreParam.visible
        && backParam.visible) {
      if (forePlayer === backPlayer
          && foreParam.index == backParam.index) {
        forePlayer.draw(foreAdaptor);
        backAdaptor.assign(foreAdaptor);
      } else {
        forePlayer.draw(foreAdaptor);
        backPlayer.draw(backAdaptor);
      }
    } else if (foreParam.visible) {
      forePlayer.draw(foreAdaptor);
      backAdaptor.clear();
    } else if (backParam.visible) {
      backPlayer.draw(backAdaptor);
      foreAdaptor.clear();
    } else {
      foreAdaptor.clear();
      backAdaptor.clear();
    }
  }

  function onCopyLayer(toback) {
    var fromParam, toParam;
    var onlyFore = (forePlayer == backPlayer);
    if (toback) {
      fromParam = foreParam;
      toParam = backParam;
      if (! onlyFore) {
        invalidate backPlayer;
        backPlayer = forePlayer;
      }
    } else {
      fromParam = backParam;
      toParam = foreParam;
      if (! onlyFore) {
        invalidate forePlayer;
        forePlayer = backPlayer;
      }
    }
    if (! onlyFore) {
      if (toParam.storage !== void) 
        emote_manager.unload(toParam.storage);
    }
    (Dictionary.assign incontextof toParam)(fromParam);
  }

  function onExchangeForeBack() {
    if (backParam.stop) {
      global.emote_player_object.stop(%[ seg: global.emote_player_object.layerList.find(this), page: "fore" ]);
      return;
    }
    var tmp;
    tmp = foreAdaptor;
    foreAdaptor = backAdaptor;
    backAdaptor = tmp;
    tmp = foreParam;
    foreParam = backParam;
    backParam = tmp;
    tmp = forePlayer;
    forePlayer = backPlayer;
    backPlayer = tmp;
  }

  property frameCount {
    getter {
      return forePlayer.tickCount;
    }
    setter(v) {
      forePlayer.tickCount = v;
    }
  }

  function onStore(dic) {
    dic.foreParam = %[]; 
    (Dictionary.assign incontextof dic.foreParam)(foreParam);
    dic.backParam = %[];
    (Dictionary.assign incontextof dic.backParam)(backParam);
    dic.onlyFore = (forePlayer === backPlayer);
    dic.foreState = forePlayer.serialize();
    if (! dic.onlyFore) {
      dic.backState = backPlayer.serialize();
    }
  }

  function onRestore(dic) {
    applyNewParam(forePlayer, foreParam, dic.foreParam);
    forePlayer.unserialize(dic.foreState);
    forePlayer.progress(0);
    if (! dic.onlyFore) {
      dividePlayer();
      applyNewParam(backPlayer, backParam, dic.backParam);
      backPlayer.unserialize(dic.backState);
      backPlayer.progress(0);
    }
  }
};


/**
 * ���[�V�������C���v���O�C��
 */
class EmotePlayerPlugin extends KAGPlugin
{
  var window;
  var layerList = [];
  var activeLayerCount = 0;
  var continuousHandlerActive = false;
  var prevTickCount;
  var waiting = false;
  var waitSeg;
  var waitCanskip;
  var waitSkipThreshold;

  function EmotePlayerPlugin(window) {
    this.window = window;
  }

  function finalize {
    clearAll();
    invalidateContinuousHandler();
    super.finalize();
  }

  function clearAll {
    for (var i = 0; i < layerList.count; i++)
      invalidate layerList[i];
    layerList.clear();
    activeLayerCount = 0;
  }

  function start(mp) {
    delete mp["time"];
    delete mp["easing"];
    var seg = +mp.seg;
    if (layerList[seg] === void) {
      layerList[seg] = new EmotePlayer(kag.fore.base, kag.back.base);
      activeLayerCount++;
    }
    var dic = %[];
    (Dictionary.assignStruct incontextof dic)(mp);
    dic["stop"] = false;
    layerList[seg].applyOpt(dic);
    invalidateContinuousHandler();
  }

  function stop(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      if (mp["page"] == "back") {
        layerList[seg].applyOpt(%[ page: "back", 
                                    visible: "false", 
                                    stop: "true" ]);
        return;
      } 
      invalidate layerList[seg];
      layerList[seg] = void;
      activeLayerCount--;
    }
    invalidateContinuousHandler();
  }

  function opt(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      layerList[seg].applyOpt(mp);
    }
  }

  function wait(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      if (layerList[seg].animating) {
        waitSeg = seg;
        waitCanskip = typeof(mp["canskip"]) == "undefined" ? true : +mp["canskip"];
        waitCanskip = waitCanskip && kag.clickSkipEnabled;
        waitSkipThreshold = waitCanskip ? 1 : 3;
        if (toSkip) {
          layerList[waitSeg].skip();
        } else {
          waiting = true;
        }
      }
    }
  }

  function variable(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      layerList[seg].applyVariable(mp);
    }
  }

  function playtimeline(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      layerList[seg].playTimeline(mp);
    }
  }

  function stoptimeline(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      var player = layerList[seg].forePlayer;
      layerList[seg].stopTimeline(mp);
    }
  }

  function fadeintimeline(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      layerList[seg].fadeinTimeline(mp);
    }
  }

  function fadeouttimeline(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      layerList[seg].fadeoutTimeline(mp);
    }
  }

  function fadetimeline(mp) {
    var seg = +mp.seg;
    if (layerList[seg] !== void) {
      layerList[seg].fadeTimeline(mp);
    }
  }

  function env(mp) {
    if (typeof(mp["meshdivisionratio"]) != "undefined")
      sf["emote_meshdivisionratio"] = +mp["meshdivisionratio"];
    if (typeof(mp["hairscale"]) != "undefined")
      sf["emote_hairscale"] = +mp["hairscale"];
    if (typeof(mp["bustscale"]) != "undefined")
      sf["emote_bustscale"] = +mp["bustscale"];
    if (typeof(mp["partsscale"]) != "undefined")
      sf["emote_partsscale"] = +mp["partsscale"];
    if (typeof(mp["used3d"]) != "undefined")
      sf["emote_used3d"] = +mp["used3d"];
    kag.saveSystemVariables();
  }

  property toSkip {
    getter {
      return kag.skipMode >= waitSkipThreshold;
    }
  }

  function releaseWait {
    var seg = +mp.seg;
    if (waiting
        && layerList[seg] !== void
        && layerList[seg].animating) {
      layerList[seg].skip();
    }
    waiting = false;
    kag.trigger("emote_wait");
  }

  function invalidateContinuousHandler {
    var nextContinuousHandlerActive = (activeLayerCount > 0);
    if (continuousHandlerActive != nextContinuousHandlerActive) {
      if (nextContinuousHandlerActive) 
        startHandler();
      else
        stopHandler();
    }
    continuousHandlerActive = nextContinuousHandlerActive;
  }

  function startHandler {
    prevTickCount = System.getTickCount();
    System.addContinuousHandler(this.onContinuousHandler);
  }

  function stopHandler {
    System.removeContinuousHandler(this.onContinuousHandler);
    if (waiting) 
      releaseWait();
  }

  function onContinuousHandler {
    if (waiting) {
      if (layerList[waitSeg] === void) {
        releaseWait();
      } else if (! layerList[waitSeg].animating) {
        releaseWait();
      }
    }
    
    var curTickCount = System.getTickCount();
    var diffTick = curTickCount - prevTickCount;
    prevTickCount = curTickCount;
    for (var i = 0; i < layerList.count; i++) {
      if (layerList[i] !== void)
        layerList[i].onTick(diffTick);
    }
  }

  function onStore(f, elm) {
    var list = f.emotelayer = [];
    for (var i = 0; i < layerList.count; i++) {
      if (layerList[i] !== void) {
        var layer = layerList[i];
        var dic = list[i] = %[];
        layer.onStore(dic);
      }
    }
  }

  function onRestore(f, clear, elm) {
    clearAll();
    var list = f.emotelayer;
    for (var i = 0; i < list.count; i++) {
      if (list[i] !== void) {
        var dic = list[i];
        var layer = layerList[i] = new EmotePlayer(kag.fore.base, kag.back.base);
        layer.onRestore(dic);
        activeLayerCount++;
      }
    }
    invalidateContinuousHandler();
  }

  function onCopyLayer(toback) {
    for (var i = 0; i < layerList.count; i++) {
      if (layerList[i] !== void)
        layerList[i].onCopyLayer(toback);
    }
  }

  function onExchangeForeBack() {
    for (var i = 0; i < layerList.count; i++) {
      if (layerList[i] !== void)
        layerList[i].onExchangeForeBack();
    }
  }

  function onStableStateChanged(stable)
  {
  }

  function onMessageHiddenStateChanged(hidden)
  {
  }

  function onTransitionFinished {
  }

  function onSaveSystemVariables()
  {
  }
};

// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����
kag.addPlugin(global.emote_player_object = new EmotePlayerPlugin(kag));

@endscript
@endif

; �}�N���o�^
@macro name="emotestart"
@eval exp="emote_player_object.start(mp);"
@endmacro
@macro name="emotestop"
@eval exp="emote_player_object.stop(mp);"
@endmacro
@macro name="emoteopt"
@eval exp="emote_player_object.opt(mp);"
@endmacro
@macro name="emotewait"
@eval exp="emote_player_object.wait(mp);"
@waittrig name="emote_wait" canskip=%canskip|true cond="emote_player_object.waiting"
@eval exp="emote_player_object.releaseWait(mp);"
@endmacro
@macro name="emotevariable"
@eval exp="emote_player_object.variable(mp);"
@endmacro
@macro name="emoteplaytimeline"
@eval exp="emote_player_object.playtimeline(mp);"
@endmacro
@macro name="emotestoptimeline"
@eval exp="emote_player_object.stoptimeline(mp);"
@endmacro
@macro name="emotefadeintimeline"
@eval exp="emote_player_object.fadeintimeline(mp);"
@endmacro
@macro name="emotefadeouttimeline"
@eval exp="emote_player_object.fadeouttimeline(mp);"
@endmacro
@macro name="emotefadetimeline"
@eval exp="emote_player_object.fadetimeline(mp);"
@endmacro
@macro name="emoteenv"
@eval exp="emote_player_object.env(mp);"
@endmacro

@return
