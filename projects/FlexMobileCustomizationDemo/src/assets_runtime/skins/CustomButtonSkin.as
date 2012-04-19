package assets_runtime.skins
{
	import flash.display.Sprite;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class CustomButtonSkin extends ButtonSkin
	{
		
		protected var _triangle:Sprite;
		
		public function CustomButtonSkin()
		{
			super();
			
			//_triangle = new Sprite();
			
		}
		
		override protected function createChildren():void
		{
			
			
			//	GRAB CUSTOM (NOT 'STANDARD' CSS PROPERTIES) FROM *.CSS FILE(S)
			var upBorderSkinClass 	: Class 	= 	this.getStyle('upBorderImage') 			as Class;
			var downBorderSkinClass	: Class 	= 	this.getStyle('downBorderImage') 		as Class;
			var disabledBorderImage	: Class 	= 	this.getStyle('disabledBorderImage')	as Class;
			
			//	USE PROPERTIES
			
			if (upBorderSkinClass != null) {
				//USE IT
				upBorderSkin	 = upBorderSkinClass;
			}
			
			if (downBorderSkinClass != null) {
				//USE IT
				downBorderSkin	 = downBorderSkinClass;
			}
			
			
			super.createChildren();
			//addChild(_triangle);
			
		}
		
			/*
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			var halfUnscaledHeight:int = Math.round(unscaledHeight/2);
			
			_triangle.graphics.beginFill(0xcee410);
			_triangle.graphics.moveTo(unscaledWidth-20,halfUnscaledHeight-5);
			_triangle.graphics.lineTo(unscaledWidth-10,halfUnscaledHeight);
			_triangle.graphics.lineTo(unscaledWidth-20,halfUnscaledHeight+5);
			_triangle.graphics.lineTo(unscaledWidth-20,halfUnscaledHeight-5);
			_triangle.graphics.endFill();
		}
		*/
		
	}
	
}

