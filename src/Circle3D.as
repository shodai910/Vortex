package {
	 public class Circle3D{
		private var _x:Number;
		private var _y:Number;
		private var _z:Number;
		private var _scale:Number;
		private var _dir:Boolean;
		private var _angle:Number;
		public function Circle3D(x:Number, y:Number, z:Number, scale:Number, angle:Number, dir:Boolean = true):void {
			_x     = x;
			_y     = y;
			_z     = z;
			_scale = scale;
			_dir   = dir;
			_angle = angle;
		}

		public function get x():Number {
			return _x;
		}

		public function set x(value:Number):void {
			_x = value;
		}

		public function get y():Number {
			return _y;
		}

		public function set y(value:Number):void {
			_y = value;
		}

		public function get z():Number {
			return _z;
		}

		public function set z(value:Number):void {
			_z = value;
		}

		public function get scale():Number {
			return _scale;
		}

		public function set scale(value:Number):void {
			_scale = value;
		}

		public function get dir():Boolean {
			return _dir;
		}
		
		public function set dir(value:Boolean):void {
			_dir = value;
		}

		public function get angle():Number {
			return _angle;
		}
		
		public function set angle(value:Number):void {
			_angle = value;
		}
	}
}