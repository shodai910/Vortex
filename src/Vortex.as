/**
 * Copyright royi ( http://wonderfl.net/user/royi )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * From: http://wonderfl.net/c/s0IQ
 */
package {
	import com.bit101.components.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width=465, height=465, backGroundColor=0xeeeeee, frameRage=60)]	
	public class Vortex extends Sprite {
		private var circles3D    :Array = []; // x, y, z, scale, anggle, dir
		private var numCircles   :int   = 0;
		private var focalLength  :int   = 100;
		
		private var sw:int, sh :int;
		private var centerX:int, centerY:int;
		
		public function Vortex() {
			sw = stage.stageWidth, sh = stage.stageHeight;
			centerX = sw * .5, centerY = sh * .5;
			
			for(var i:int = 0; i < 40; i++) {
				addCircle(sw * .5, sh * .5, 0, i);
			}
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function addCircle(x:Number, y:Number, z:Number, angle:Number, dir:Boolean = true):void {
			circles3D.push(x, y, z, 1, angle, dir);
			numCircles++;
		}
		
		private function loop(evt:Event):void {
			with(graphics){
				clear();
				beginFill(0xeeeeee);
				drawRect(0, 0, sw, sh);
				endFill();
			}
			
			for(var i:int = 0; i < numCircles; i++) {
				var ix:int     = i * 6;
				var iy:int     = ix + 1;
				var iz:int     = ix + 2;
				var iScale:int = ix + 3;
				var iAngle:int = ix + 4;
				var iDir  :int = ix + 5;
				
				var dir:Boolean  = circles3D[iDir];
				var angle:Number = circles3D[iAngle];
				
				angle += .05;
				
				if(40 <= Math.abs(angle)) angle = 0;
				
				var zPos :Number = angle * 50;
				var scale:Number = focalLength / (focalLength + zPos);
				var xPos :Number = (((500) * Math.sin(angle)) + (mouseX-centerX)*10) * Math.abs(scale) + (sw-mouseX);
				var yPos :Number = (((500) * Math.cos(angle)) + (mouseY-centerY)*10) * Math.abs(scale) + (sw-mouseY);
				
				
				circles3D[ix]     = xPos;
				circles3D[iy]     = yPos;
				circles3D[iz]     = zPos;
				circles3D[iScale] = scale;
				circles3D[iAngle] = angle;
				
				graphics.beginFill((angle * 5) + 500000);
				graphics.drawCircle(xPos, yPos, (40 * scale));
				graphics.endFill();
					
			}
		}
	}
	

}