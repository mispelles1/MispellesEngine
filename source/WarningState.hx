package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class WarningState extends MusicBeatState
{
    var boobaWarn:FlxSprite;

    override function create()
    {
        transIn = FlxTransitionableState.defaultTransIn;
        transOut = FlxTransitionableState.defaultTransOut;

        boobaWarn = new FlxSprite().loadGraphic(Paths.image('heyWarning'));
		boobaWarn.screenCenter();
		add(boobaWarn);
    }

    override function update(elapsed:Float)
        {
            if (controls.ACCEPT)
            {
                fancyOpenURL("https://youtu.be/dQw4w9WgXcQ");
            }
            if (controls.BACK)
            {
                FlxG.switchState(new MainMenuState());
            }
            super.update(elapsed);
        }
}