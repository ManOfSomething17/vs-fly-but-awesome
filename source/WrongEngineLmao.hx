package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.math.FlxMath;
import flixel.system.FlxSound;

class WrongEngineLmao extends MusicBeatState
{
    var adhdBoyfriend:FlxSprite;

    var loltop:FlxText;
    var lolbottom:FlxText;

    var fuckyou:FlxText;

    var pressesCounted:Int = 0;

    override function create()
    {
        FlxG.sound.music.stop();
        FlxG.sound.playMusic(Paths.music('breakfast', 'shared'), 0.1);
        
		Conductor.changeBPM(160);
		FlxG.camera.zoom += 0.015;

        var bg:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width), Std.int(FlxG.height), FlxColor.WHITE);
        bg.active = false;
        add(bg);

        adhdBoyfriend = new FlxSprite(0, 0);
        adhdBoyfriend.frames = Paths.getSparrowAtlas('pfff/bfFunne');
		adhdBoyfriend.animation.addByPrefix('idle', "silly", 24);
		adhdBoyfriend.animation.play('idle');
        adhdBoyfriend.scale.set(0.9, 0.9);
        adhdBoyfriend.antialiasing = true;
        adhdBoyfriend.screenCenter();
        add(adhdBoyfriend);

        loltop = new FlxText(0, 8, 0, "WRONG ENGINE LOLLLLLL", 80);
		loltop.setFormat(Paths.font("impact.ttf"), 80, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
        loltop.borderSize = 2.5;
        loltop.antialiasing = true;
        loltop.screenCenter(X);
        add(loltop);

        lolbottom = new FlxText(0, FlxG.height - loltop.height - 8, 0, "HARDCODE MUCH?", 80);
		lolbottom.setFormat(Paths.font("impact.ttf"), 80, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
        lolbottom.borderSize = 2.5;
        lolbottom.antialiasing = true;
        lolbottom.screenCenter(X);
        add(lolbottom);

        fuckyou = new FlxText(0, (FlxG.height / 1.5) + 80, 0, "(ur softlocked btw)", 20);
		fuckyou.setFormat(Paths.font("arial.ttf"), 20, FlxColor.BLACK, CENTER);
        fuckyou.antialiasing = true;
        fuckyou.screenCenter(X);
        add(fuckyou);
        fuckyou.visible = false;

        super.create();
    }

	override function update(elapsed:Float)
	{
        if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

		FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, 0.95);

        if(controls.BACK || controls.ACCEPT)
        {
            pressesCounted++;
            if(!fuckyou.visible && pressesCounted > 2) fuckyou.visible = true;
            FlxG.sound.play(Paths.sound('frt'));
        }

		super.update(elapsed);
	}

	override function beatHit()
	{
		super.beatHit();

		if (FlxG.camera.zoom < 1.35 && curBeat % 4 == 0)
		{
			FlxG.camera.zoom += 0.015;
		}

		FlxG.log.add(curBeat);
	}
}