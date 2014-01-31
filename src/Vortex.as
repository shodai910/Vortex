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
		private var numCircles   :int = 0;
		private var focalLength  :int = 100;
		
		// 画面サイズ、画面の中央値
		private var sw:int, sh :int;
		private var centerX:int, centerY:int;
		
		// loop()で使用する変数
		private var ix:int;
		private var iy    :int;
		private var iz    :int;
		private var iScale:int;
		private var iAngle:int;
		private var iDir  :int;
		private var dir   :Boolean
		private var angle :Number
		private var zPos  :Number;
		private var scale :Number;
		private var xPos  :Number;
		private var yPos  :Number;
		private var radius:uint = 500;
		
		public function Vortex() {
			// 画面サイズ、中央値取得
			sw = stage.stageWidth, sh = stage.stageHeight;
			centerX = sw >> 1, centerY = sh >> 1;
			
			// 球の生成
			for(var i:int = 0; i < 1; i++) {
				addCircle(centerX, centerY, 0, i);
			}
			
			// 毎フレームloop()を実行
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		// 球を生成する
		private function addCircle(x:Number, y:Number, z:Number, angle:Number, dir:Boolean = true):void {
			circles3D.push(x, y, z, 1, angle, dir);
			numCircles++;
		}
		
		// 背景及び球の描画
		private function loop(evt:Event):void {
			// 背景の描画
			with(graphics){
				clear();
				beginFill(0xeeeeee);
				drawRect(0, 0, sw, sh);
				endFill();
			}
			
			// 球の移動と描画
			for(var i:int = 0; i < numCircles; i++) {
				// 各値を設定
				ix     = i * 6;
				iy     = ix + 1;
				iz     = ix + 2;
				iScale = ix + 3;
				iAngle = ix + 4;
				iDir   = ix + 5;
				
				dir    = circles3D[iDir];
				angle  = circles3D[iAngle];
				
				angle += .05;
				
				if(40 <= Math.abs(angle)) angle = 0;
				
				zPos  = angle * 50;
				scale = focalLength / (focalLength + zPos);
				
				xPos  = ((radius * Math.sin(angle)) + (mouseX-centerX) * 10) * Math.abs(scale) + (sw - mouseX);
				yPos  = ((radius * Math.cos(angle)) + (mouseY-centerY) * 10) * Math.abs(scale) + (sw - mouseY);

				
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