package
{
	import com.randioo.usb.USBMidiInput;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class USBMIDITest extends Sprite
	{
		private var textField:TextField;
		private var textNum:TextField;
		public function USBMIDITest()
		{
			this.stage.align=StageAlign.TOP_LEFT;
			this.stage.scaleMode=StageScaleMode.NO_SCALE;
			USBMidiInput.init();
			textField=new TextField();
			textField.width=this.stage.stageWidth; 
			this.addChild(textField);
			
			textNum=new TextField();
			textNum.width=200;
			textNum.border=true;
			this.addChild(textNum)
			textNum.y=100;
			textNum.text=USBMidiInput.numDevices.num;
			trace("开始！")
			var devData:Object = USBMidiInput.getDeviceAt(1);
			trace(devData.id)
			trace(devData.name)
			trace(devData.info)
			trace(devData.interf)
			trace(devData.input)
			trace(devData.output)
			trace(devData.structVersion)			
			this.addEventListener(Event.ENTER_FRAME, onEventFrame);
		
			
		}
		private function onEventFrame(e:Event):void
		{			
			var devData:Object = USBMidiInput.updata(1);
			if(devData.PollStatus&&devData.length)
			{
				trace("timestamp:"+devData.timestamp,"Status:"+devData.Status,"Data1:"+devData.Data1,"Data2:"+devData.Data2)
			}	
		}
	}
}