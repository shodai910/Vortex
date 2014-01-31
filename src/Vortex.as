/**
 * Copyright royi ( http://wonderfl.net/user/royi )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * From: http://wonderfl.net/c/s0IQ
 */
package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width=465, height=465, backGroundColor=0xeeeeee, frameRage=60)]	
	public class Vortex extends Sprite {
		private var circles3D    :Vector.<Circle3D>; // x, y, z, scale, anggle, dir
		private var numCircles   :int = 0;
		private var focalLength  :int = 100;
		
		// 画面サイズ、画面の中央値
		private var sw:int, sh :int;
		private var centerX:int, centerY:int;
		
		// 進行方向 0=右回り 1=左周り
		private var dirFlg:uint = 1;
		
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
			
			circles3D = new Vector.<Circle3D>(); 
			
			// 球の生成
			for(var i:int = 0; i < 40; i++) {
				addCircle(centerX, centerY, 0, i);
			}
			
			// 毎フレームloop()を実行
			addEventListener(Event.ENTER_FRAME, loop);
			
			// クリック時、球の移動方向を変える
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		// 球を生成する
		private function addCircle(x:Number, y:Number, z:Number, angle:Number, dir:Boolean = true):void {
			circles3D.push(new Circle3D(x, y, z, 1, angle, dir));
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
				// 方向、角度の設定
				dir    = circles3D[i].dir;
				angle  = circles3D[i].angle;
				
				// onClickでdirFlgが変更される
				if(dirFlg) {
					angle += .05;
				} else {
					angle -= .05;
				}
				
				if(40 <= Math.abs(angle)) angle = 0;
				
				zPos  = angle * 50;
				scale = focalLength / (focalLength + zPos);
				xPos  = ((-radius * Math.sin(angle)) + (mouseX-centerX) * 10) * Math.abs(scale) + (sw - mouseX);
				yPos  = ((-radius * Math.cos(angle)) + (mouseY-centerY) * 10) * Math.abs(scale) + (sw - mouseY);
				
				circles3D[i].x     = xPos;
				circles3D[i].y     = yPos;
				circles3D[i].z     = zPos;
				circles3D[i].scale = scale;
				circles3D[i].angle = angle;
				
				// 球の描画
				with(graphics) {
					graphics.beginFill((angle * 5) + 500000);
					graphics.drawCircle(xPos, yPos, (40 * scale));
					graphics.endFill();
				}
			}
		}
		
		// クリック時、
		private function onClick(evt:Event):void {
			// 1のとき0に、0のとき1に
			dirFlg = Math.abs(1 - dirFlg); 
		}
	}
}