package;

import flixel.input.keyboard.FlxKey;
import haxe.Exception;
import openfl.geom.Matrix;
import openfl.display.BitmapData;
import openfl.utils.AssetType;
import lime.graphics.Image;
import flixel.graphics.FlxGraphic;
import openfl.utils.AssetManifest;
import openfl.utils.AssetLibrary;
import flixel.system.FlxAssets;

import lime.app.Application;
import lime.media.AudioContext;
import lime.media.AudioManager;
import openfl.Lib;
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import flixel.ui.FlxButton;
import openfl.filters.ShaderFilter;

using StringTools;

class RPGState extends MusicBeatState
{
    var enterGame:FlxButton;
    var exitGame:FlxButton;
    var comingSoon:FlxText;
    var quitYButton:FlxButton;
    var quitNButton:FlxButton;

    override public function create()
    {
       FlxG.mouse.visible = true;
  
       comingSoon = new FlxText(0, 0, 1300); // x, y, width
       comingSoon.text = "COMING VERY SOON!!!!";
       comingSoon.setFormat("assets/fonts/pixel.otf", 20, FlxColor.WHITE, CENTER);
       comingSoon.setBorderStyle(OUTLINE, FlxColor.BLUE, 1);
       add(comingSoon);

       var yesButton:FlxButton = new FlxButton(600, 400, "Go back", OnClickGoBackButton);
       yesButton.setGraphicSize(Std.int(yesButton.width * 2.5));
       add(yesButton);
    }

    function OnClickGoBackButton():Void
    {
        FlxG.switchState(new MainMenuState());
        FlxG.mouse.visible = false;
    }
}