package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class IconSetting
{
	public var x(default, null):Int;
	public var y(default, null):Int;
	public var scale(default, null):Float;
	public var flipped(default, null):Bool;

	public function new(x:Int = 0, y:Int = 0, scale:Float = 1.0, flipped:Bool = false)
	{
		this.x = x;
		this.y = y;
		this.scale = scale;
		this.flipped = flipped;
	}
}

class MenuIcon extends FlxSprite
{
	private static var settings:Map<String, IconSetting> = [
		'bf' => new IconSetting(0, -20, 1.0, true),
		'gf' => new IconSetting(50, 80, 1.5, true),
		'dad' => new IconSetting(95, 20, 0.6),
		'spooky' => new IconSetting(125, 10),
		'pico' => new IconSetting(105, 10, 1.0, true),
		'mom' => new IconSetting(115, 15),
		'parents-christmas' => new IconSetting(95, 20, 0.7),
		'senpai' => new IconSetting(95, 10, 0.7)
	];
	//this should be easy i said.
	//i was wrong, evry time i compiled this shit it crashed, but it's fixed LMAO- Mispelles

	private var flipped:Bool = false;

	public function new(x:Int, y:Int, scale:Float, flipped:Bool)
	{
		super(x, y);
		this.flipped = flipped;

		antialiasing = true;

		frames = Paths.getSparrowAtlas('campaign_menu_UI_icons');

		animation.addByPrefix('bf', "bf idle", 24);
		animation.addByPrefix('gf', "gf idle", 24);
		animation.addByPrefix('dad', "dad idle", 24);
		animation.addByPrefix('spooky', "spooky idle", 24);
		animation.addByPrefix('pico', "pico idle", 24);
		animation.addByPrefix('mom', "mom idle", 24);
		animation.addByPrefix('parents-christmas', "momdad idle", 24);
		animation.addByPrefix('senpai', "senpai idle", 24);

		setGraphicSize(Std.int(width * scale));
		updateHitbox();
	}

	public function setIcon(koolIcon:String):Void
	{
		if (koolIcon == '')
		{
			visible = false;
			return;
		}
		else
		{
			visible = true;
		}

		animation.play(koolIcon);

		var setting:IconSetting = settings[koolIcon];
		offset.set(setting.x, setting.y);
		setGraphicSize(Std.int(width * setting.scale));
		flipX = setting.flipped != flipped;
	}
}
