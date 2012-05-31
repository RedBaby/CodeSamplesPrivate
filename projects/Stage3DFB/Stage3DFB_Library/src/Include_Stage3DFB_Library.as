package 
{
	import alternativa.Alternativa3D;
	import alternativa.engine3d.controllers.SimpleObjectController;
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.core.Resource;
	import alternativa.engine3d.core.View;
	import alternativa.engine3d.loaders.ParserCollada;
	import alternativa.engine3d.loaders.ParserMaterial;
	import alternativa.engine3d.loaders.TexturesLoader;
	import alternativa.engine3d.materials.TextureMaterial;
	import alternativa.engine3d.objects.Mesh;
	import alternativa.engine3d.objects.Surface;
	import alternativa.engine3d.primitives.Box;
	import alternativa.engine3d.primitives.GeoSphere;
	import alternativa.engine3d.primitives.Plane;
	import alternativa.engine3d.resources.ExternalTextureResource;
	import alternativa.engine3d.resources.Geometry;
	
	import away3d.containers.View3D;
	import away3d.core.base.Geometry;
	import away3d.debug.AwayStats;
	import away3d.events.LoaderEvent;
	import away3d.loaders.Loader3D;
	import away3d.loaders.parsers.Parsers;
	import away3d.materials.ColorMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.CubeGeometry;
	import away3d.tools.commands.Align;
	
	import com.bit101.components.HBox;
	import com.bit101.components.ProgressBar;
	import com.bit101.components.Text;
	import com.bit101.components.TextArea;
	import com.bit101.components.VBox;
	import com.bit101.components.Window;
	import com.greensock.TweenMax;
	import com.greensock.data.TweenMaxVars;
	import com.greensock.events.TweenEvent;
	
	import flare.basic.Scene3D;
	import flare.loaders.ColladaLoader;
	import flare.loaders.Flare3DLoader1;
	import flare.primitives.Cube;
	import flare.primitives.SkyBox;
	import flare.primitives.Sphere;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import spark.components.VGroup;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.textures.Texture;
	
	import textureAtlas.DynamicAtlas;
	
	public class Include_Stage3DFB_Library
	{
		public function Include_Stage3DFB_Library()
		{
			var x : Array = new Array (
				View3D,
				LoaderEvent,
				Loader3D,
				CubeGeometry,
				StaticLightPicker,
				ColorMaterial,
				alternativa.engine3d.resources.Geometry,
				away3d.core.base.Geometry,
				alternativa.Alternativa3D,
				flare.loaders.Flare3DLoader1,
				flare.basic.Scene3D,
				flare.primitives.Cube,
				flare.primitives.SkyBox,
				flare.primitives.Sphere,
				AwayStats,
				
				
				ColladaLoader,
				
				alternativa.engine3d.core.Camera3D,
				alternativa.engine3d.core.Object3D,
				alternativa.engine3d.core.Resource,
				alternativa.engine3d.core.View,
				alternativa.engine3d.loaders.ParserCollada,
				alternativa.engine3d.loaders.ParserMaterial,
				alternativa.engine3d.loaders.TexturesLoader,
				alternativa.engine3d.materials.TextureMaterial,
				alternativa.engine3d.objects.Mesh,
				alternativa.engine3d.objects.Surface,
				alternativa.engine3d.resources.ExternalTextureResource,
				alternativa.engine3d.resources.Geometry,
				alternativa.engine3d.primitives.Box,
				alternativa.engine3d.primitives.GeoSphere,
				alternativa.engine3d.primitives.Plane,
				alternativa.engine3d.controllers.SimpleObjectController,
				
				Starling,
				DynamicAtlas,
				Quad,
				Texture,
				Image,
				MovieClip,
				
				
				Text,
				ProgressBar,
				TextArea,
				Window,
				HBox,
				VBox,
				TweenMax,
				TweenMaxVars,
				TweenEvent,
				
				
				
				Parsers
				); 
		}
	}
}