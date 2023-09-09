package mobile;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.util.FlxColor;
import flixel.input.FlxInput;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;
import flixel.input.keyboard.FlxKey;
import flixel.FlxCamera;
import flixel.FlxState;

@:access(flixel.input.keyboard.FlxKeyboard)
class HitBox extends FlxTypedGroup<FlxButton>
{
	public static var LeftHB:FlxButton;
	public static var DownHB:FlxButton;
	public static var UpHB:FlxButton;
	public static var RightHB:FlxButton;
	static var camMobile:FlxCamera;
	
    public static var LEFTKEY:FlxInput<FlxKey>;
    public static var DOWNKEY:FlxInput<FlxKey>;
    public static var UPKEY:FlxInput<FlxKey>;
    public static var RIGHTKEY:FlxInput<FlxKey>;

	override public function new()
	{
        super();

		LEFTKEY = FlxG.keys.getKey(FlxKey.LEFT);
        DOWNKEY = FlxG.keys.getKey(FlxKey.DOWN);
        UPKEY = FlxG.keys.getKey(FlxKey.UP);
        RIGHTKEY = FlxG.keys.getKey(FlxKey.RIGHT);
		
		var LeftHB = new FlxButton(0, 0, "");
        LeftHB.makeGraphic(320, 720, FlxColor.PURPLE);
        LeftHB.alpha = 0;
        LeftHB.scrollFactor.set();
        LeftHB.onDown.callback = function() {
            StartKeyPress(LEFTKEY);
            LeftHB.alpha = 0.15;
        };
		LeftHB.onOut.callback = function() {
            EndKeyPress(LEFTKEY);
            LeftHB.alpha = 0;
        };
        LeftHB.onUp.callback = function() {
            EndKeyPress(LEFTKEY);
            LeftHB.alpha = 0;
        };
        add(LeftHB);

        var DownHB = new FlxButton(0, 0, "");
        DownHB.makeGraphic(320, 720, FlxColor.CYAN);
        DownHB.x = 320;
        DownHB.scrollFactor.set();
        DownHB.alpha = 0;
        DownHB.onDown.callback = function() {
            StartKeyPress(DOWNKEY);
            DownHB.alpha = 0.15;
        };
		DownHB.onOut.callback = function() {
            EndKeyPress(DOWNKEY);
            DownHB.alpha = 0;
        };
        DownHB.onUp.callback = function() {
            EndKeyPress(DOWNKEY);
            DownHB.alpha = 0;
        };
        add(DownHB);

        var UpHB = new FlxButton(0, 0, "");
        UpHB.makeGraphic(320, 720, FlxColor.GREEN);
        UpHB.x = 640;
        UpHB.scrollFactor.set();
        UpHB.alpha = 0.0;
        UpHB.onDown.callback = function() {
            StartKeyPress(UPKEY);
            UpHB.alpha = 0.15;
        };
		UpHB.onOut.callback = function() {
            EndKeyPress(UPKEY);
            UpHB.alpha = 0;
        };
        UpHB.onUp.callback = function() {
            EndKeyPress(UPKEY);
            UpHB.alpha = 0;
        };
        add(UpHB);

        var RightHB = new FlxButton(0, 0, "");
        RightHB.makeGraphic(320, 720, FlxColor.RED);
        RightHB.x = 960;
        RightHB.scrollFactor.set();
        RightHB.alpha = 0.0;
        RightHB.onDown.callback = function() {
            StartKeyPress(RIGHTKEY);
            RightHB.alpha = 0.15;
        };
		RightHB.onOut.callback = function() {
            EndKeyPress(RIGHTKEY);
            RightHB.alpha = 0;
        };
        RightHB.onUp.callback = function() {
            EndKeyPress(RIGHTKEY);
            RightHB.alpha = 0;
        };
        add(RightHB);

		camMobile = new FlxCamera();
        camMobile.bgColor.alpha = 0;
        FlxG.cameras.add(camMobile);

        LeftHB.cameras = [camMobile];
        DownHB.cameras = [camMobile];
        UpHB.cameras = [camMobile];
        RightHB.cameras = [camMobile];
	}
	
	public static function StartKeyPress(val:FlxInput<FlxKey>):Void
		{
			val.press();
		}

	public static function EndKeyPress(val:FlxInput<FlxKey>):Void
		{
			val.release();
		}
}
