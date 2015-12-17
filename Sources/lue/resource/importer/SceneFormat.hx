package lue.resource.importer;

typedef TSceneFormat = {
	@:optional var geometry_resources:Array<TGeometryResource>;
	@:optional var light_resources:Array<TLightResource>;
	@:optional var camera_resources:Array<TCameraResource>;
	@:optional var material_resources:Array<TMaterialResource>;
	@:optional var particle_resources:Array<TParticleResource>;
	@:optional var shader_resources:Array<TShaderResource>;
	@:optional var pipeline_resources:Array<TPipelineResource>;

	@:optional var nodes:Array<TNode>;
}

typedef TGeometryResource = {
	var id:String;
	var mesh:TMesh;
}

typedef TMesh = {
	var primitive:String;
	var vertex_arrays:Array<TVertexArray>;
	var index_arrays:Array<TIndexArray>;
	@:optional var skin:TSkin;
	@:optional var instance_offsets:Array<Float>;
}

typedef TSkin = {
	var transform:TTransform;
	var skeleton:TSkeleton;
	var bone_count_array:Array<Int>;
	var bone_index_array:Array<Int>;
	var bone_weight_array:Array<Float>;
}

typedef TSkeleton = {
	var bone_ref_array:Array<String>;
	var transforms:Array<Array<Float>>; // size = 16
}

typedef TVertexArray = {
	var attrib:String;
	var size:Int;
	var values:Array<Float>;
}

typedef TIndexArray = {
	var size:Int;
	var values:Array<Int>;
	var material:Int;
}

typedef TLightResource = {
	var id:String;
	var color:Array<Float>;
}

typedef TCameraResource = {
	var id:String;
	var clear_color:Array<Float>;
	var near_plane:Float;
	var far_plane:Float;
	var frustum_culling:Bool;
	var pipeline:String;
	var type:String;
}

typedef TMaterialResource = {
	var id:String;
	var shader:String;
	var cast_shadow:Bool;
	var contexts:Array<TMaterialContext>;
}

typedef TMaterialContext = {
	var id:String;
	var bind_constants:Array<TBindConstant>;
	var bind_textures:Array<TBindTexture>;
}

typedef TBindConstant = {
	var id:String;
	@:optional var vec4:Array<Float>;
	@:optional var vec3:Array<Float>;
	@:optional var float:Float;
	@:optional var bool:Bool;
}

typedef TBindTexture = {
	var id:String;
	var name:String;
}

typedef TShaderResource = {
	var id:String;
	var vertex_structure:Array<TVertexData>;
	var contexts:Array<TShaderContext>;
}

typedef TVertexData = {
	var name:String;
	var size:Int;
}

typedef TShaderContext = {
	var id:String;
	var depth_write:Bool;
	var compare_mode:String;
	var cull_mode:String;
	var blend_source:String;
	var blend_destination:String;
	var vertex_shader:String;
	var fragment_shader:String;
	var constants:Array<TShaderConstant>;
	var texture_units:Array<TTextureUnit>;
}

typedef TShaderConstant = {
	var id:String;
	var type:String;
	@:optional var link:String;
	@:optional var vec4:Array<Float>;
	@:optional var vec3:Array<Float>;
	@:optional var float:Float;
	@:optional var bool:Bool;
}

typedef TTextureUnit = {
	var id:String;
}

typedef TPipelineResource = {
	var id:String;
	var render_targets:Array<TPipelineRenderTarget>;
	var stages:Array<TPipelineStage>;
}

typedef TPipelineRenderTarget = {
	var id:String;
	var width:Int;
	var height:Int;
}

typedef TPipelineStage = {
	var command:String;
	@:optional var params:Array<String>;
}

typedef TParticleResource = {
	var id:String;
	var count:Int;
	var lifetime:Float;
	var normal_factor:Float;
	var object_align_factor:Array<Float>;
	var factor_random:Float;
}

// Skinned
typedef TNode = {
	var type:String;
	var id:String;
	var object_ref:String;
	var material_refs:Array<String>;
	var particle_refs:Array<TParticleReference>;
	var transform:TTransform;
	@:optional var animation:TAnimation;
	var nodes:Array<TNode>;
	var traits:Array<TTrait>;
	@:optional var parent:TNode;
	@:optional var visible:Bool;
}

typedef TParticleReference = {
	var id:String;
	var particle:String;
	var seed:Int;
}

typedef TTrait = {
	var type:String;
	var class_name:String;
}

typedef TTransform = {
	@:optional var target:String;
	var values:Array<Float>;
}

typedef TAnimation = {
	//var tracks:Array<TTrack>;
	var track:TTrack;
}

typedef TTrack = {
	var target:String;
	var time:TTime;
	var value:TValue;
}

typedef TTime = {
	var values:Array<Float>;
}

typedef TValue = {
	var values:Array<Array<Float>>;
}
