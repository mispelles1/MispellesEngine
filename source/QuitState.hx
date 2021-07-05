package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.ui.FlxButton;
import io.newgrounds.NG;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import flixel.addons.effects.chainable.FlxOutlineEffect;
import flixel.addons.effects.chainable.FlxRainbowEffect;
import flixel.addons.effects.chainable.FlxShakeEffect;
import flixel.addons.effects.chainable.FlxTrailEffect;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.effects.chainable.IFlxEffect;
import lime.app.Application;
import flash.system.System; // Or nme.system.System if you're using NME

// in your FlxButton callback:

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class QuitState extends MusicBeatState
{
    var fredsText:FlxText;
    var quitYButton:FlxButton;
    var quitNButton:FlxButton;
    var quitGameCallBack:FlxButton;
    var noQuitGameCallBack:FlxButton;
    var magenta:FlxSprite;
    var screen:FlxSprite;
    var glitchSprite:FlxGlitchEffect;

    override public function create()
    {
        FlxG.camera.fade(FlxColor.BLACK, 0.12, true);

        magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.color = 0xFFfd719b;
		add(magenta);

        var yesButton:FlxButton = new FlxButton(600, 400, "Yes?", OnClickYesButton);
        yesButton.setGraphicSize(Std.int(yesButton.width * 2.5));
        add(yesButton);

        var noButton:FlxButton = new FlxButton(500, 190, "No?", OnClickNoButton);
        noButton.setGraphicSize(Std.int(yesButton.width * 2.5));
        noButton.screenCenter();
        add(noButton);

        fredsText = new FlxText(0, 0, 1300); // x, y, width
        fredsText.text = "Do you really wish to leave?";
        fredsText.setFormat("assets/fonts/pixel.otf", 20, FlxColor.WHITE, CENTER);
        fredsText.setBorderStyle(OUTLINE, FlxColor.BLUE, 1);
        add(fredsText);

        FlxG.mouse.visible = true;
    }

    function OnClickYesButton():Void
    {
        if (FlxG.random.bool(0.01))
        {
            FlxG.openURL('https://youtu.be/dQw4w9WgXcQ');
        }
        else
            Sys.exit(0);
    }

    function OnClickNoButton():Void
    {
        FlxG.switchState(new MainMenuState());


    }


}
