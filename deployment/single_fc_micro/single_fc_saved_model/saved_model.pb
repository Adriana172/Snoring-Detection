[
ńÖ
:
Add
x"T
y"T
z"T"
Ttype:
2	
A
AddV2
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(

AudioMicrofrontend	
audio
filterbanks"out_type"
sample_rateint}"
window_sizeint"
window_stepint
"
num_channelsint " 
upper_band_limitfloat% `ęE" 
lower_band_limitfloat%  úB"
smoothing_bitsint
"
even_smoothingfloat%ÍĚĚ<"
odd_smoothingfloat%Âu="$
min_signal_remainingfloat%ÍĚL="
enable_pcanbool( "
pcan_strengthfloat%33s?"
pcan_offsetfloat%   B"
	gain_bitsint"

enable_logbool("
scale_shiftint"
left_contextint "
right_contextint "
frame_strideint"
zero_paddingbool( "
	out_scaleint"
out_typetype0:
2
p
AudioSpectrogram	
input
spectrogram"
window_sizeint"
strideint"
magnitude_squaredbool( 
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype

	DecodeWav
contents	
audio
sample_rate"$
desired_channelsint˙˙˙˙˙˙˙˙˙"#
desired_samplesint˙˙˙˙˙˙˙˙˙
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.15.02unknown˙A
I
wav_dataPlaceholder*
_output_shapes
: *
shape: *
dtype0
}
decoded_sample_data	DecodeWavwav_data*
desired_channels*!
_output_shapes
:	}: *
desired_samples}

AudioSpectrogramAudioSpectrogramdecoded_sample_data*#
_output_shapes
:1*
strideŔ*
window_sizeŕ*
magnitude_squared(
J
Mul/yConst*
valueB
 * ţ˙F*
_output_shapes
: *
dtype0
P
MulMuldecoded_sample_dataMul/y*
T0*
_output_shapes
:	}
Z
CastCastMul*
_output_shapes
:	}*

SrcT0*
Truncate( *

DstT0
`
Reshape/shapeConst*
valueB:
˙˙˙˙˙˙˙˙˙*
_output_shapes
:*
dtype0
[
ReshapeReshapeCastReshape/shape*
T0*
_output_shapes	
:}*
Tshape0
¤
AudioMicrofrontendAudioMicrofrontendReshape*
	gain_bits*
window_size*
smoothing_bits
*

enable_log(*
pcan_offset%   B*
window_step*
lower_band_limit%  úB*
pcan_strength%33s?*
sample_rate}*
frame_stride*
right_context *
enable_pcan(*
min_signal_remaining%ÍĚL=*
even_smoothing%ÍĚĚ<*
_output_shapes

:1(*
upper_band_limit% `ęE*
zero_padding( *
out_type0*
num_channels(*
left_context *
odd_smoothing%Âu=*
	out_scale*
scale_shift
L
Mul_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   =
R
Mul_1MulAudioMicrofrontendMul_1/y*
T0*
_output_shapes

:1(
`
Reshape_1/shapeConst*
_output_shapes
:*
valueB"˙˙˙˙¨  *
dtype0
d
	Reshape_1ReshapeMul_1Reshape_1/shape*
Tshape0*
_output_shapes
:	¨*
T0

*weights/Initializer/truncated_normal/shapeConst*
dtype0*
_class
loc:@weights*
valueB"¨     *
_output_shapes
:

)weights/Initializer/truncated_normal/meanConst*
valueB
 *    *
_output_shapes
: *
dtype0*
_class
loc:@weights

+weights/Initializer/truncated_normal/stddevConst*
_class
loc:@weights*
_output_shapes
: *
dtype0*
valueB
 *o:
ß
4weights/Initializer/truncated_normal/TruncatedNormalTruncatedNormal*weights/Initializer/truncated_normal/shape*
seed2 *
dtype0*
_class
loc:@weights*

seed *
T0*
_output_shapes
:	¨
Ř
(weights/Initializer/truncated_normal/mulMul4weights/Initializer/truncated_normal/TruncatedNormal+weights/Initializer/truncated_normal/stddev*
T0*
_class
loc:@weights*
_output_shapes
:	¨
Ć
$weights/Initializer/truncated_normalAdd(weights/Initializer/truncated_normal/mul)weights/Initializer/truncated_normal/mean*
_output_shapes
:	¨*
_class
loc:@weights*
T0

weights
VariableV2*
shape:	¨*
shared_name *
	container *
_output_shapes
:	¨*
_class
loc:@weights*
dtype0
ś
weights/AssignAssignweights$weights/Initializer/truncated_normal*
validate_shape(*
_class
loc:@weights*
T0*
use_locking(*
_output_shapes
:	¨
g
weights/readIdentityweights*
T0*
_class
loc:@weights*
_output_shapes
:	¨
|
bias/Initializer/zerosConst*
valueB*    *
dtype0*
_class
	loc:@bias*
_output_shapes
:

bias
VariableV2*
	container *
shape:*
_class
	loc:@bias*
dtype0*
shared_name *
_output_shapes
:

bias/AssignAssignbiasbias/Initializer/zeros*
_class
	loc:@bias*
validate_shape(*
use_locking(*
T0*
_output_shapes
:
Y
	bias/readIdentitybias*
_output_shapes
:*
_class
	loc:@bias*
T0
x
MatMulMatMul	Reshape_1weights/read*
transpose_b( *
_output_shapes

:*
transpose_a( *
T0
H
addAddV2MatMul	bias/read*
_output_shapes

:*
T0
G
labels_softmaxSoftmaxadd*
T0*
_output_shapes

:
Y
save/filename/inputConst*
_output_shapes
: *
valueB Bmodel*
dtype0
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
_output_shapes
: *
dtype0
e

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0*
_output_shapes
: 
n
save/SaveV2/tensor_namesConst*
dtype0*"
valueBBbiasBweights*
_output_shapes
:
g
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueBB B 
z
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbiasweights*
dtypes
2
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
_output_shapes
: *
T0*
_class
loc:@save/Const

save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*"
valueBBbiasBweights
y
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
valueBB B *
_output_shapes
:
¤
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes

::

save/AssignAssignbiassave/RestoreV2*
_output_shapes
:*
T0*
_class
	loc:@bias*
validate_shape(*
use_locking(
Ą
save/Assign_1Assignweightssave/RestoreV2:1*
_class
loc:@weights*
use_locking(*
_output_shapes
:	¨*
T0*
validate_shape(
6
save/restore_allNoOp^save/Assign^save/Assign_1
[
save_1/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
r
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
_output_shapes
: *
dtype0*
shape: 
i
save_1/ConstPlaceholderWithDefaultsave_1/filename*
_output_shapes
: *
shape: *
dtype0

save_1/StringJoin/inputs_1Const*
_output_shapes
: *
dtype0*<
value3B1 B+_temp_5916ff2272f74b76a8edc716ac03b454/part
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
S
save_1/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 

save_1/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*"
valueBBbiasBweights*
_output_shapes
:
x
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0*
_output_shapes
:

save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesbiasweights"/device:CPU:0*
dtypes
2
¨
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*)
_class
loc:@save_1/ShardedFilename*
T0*
_output_shapes
: 
˛
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
_output_shapes
:*
N*
T0*

axis 

save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 

save_1/RestoreV2/tensor_namesConst"/device:CPU:0*"
valueBBbiasBweights*
_output_shapes
:*
dtype0
{
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB B 
Ź
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*
_output_shapes

::*
dtypes
2

save_1/AssignAssignbiassave_1/RestoreV2*
_class
	loc:@bias*
T0*
use_locking(*
validate_shape(*
_output_shapes
:
Ľ
save_1/Assign_1Assignweightssave_1/RestoreV2:1*
T0*
validate_shape(*
use_locking(*
_output_shapes
:	¨*
_class
loc:@weights
>
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"¨
	variables
U
	weights:0weights/Assignweights/read:02&weights/Initializer/truncated_normal:08
>
bias:0bias/Assignbias/read:02bias/Initializer/zeros:08"˛
trainable_variables
U
	weights:0weights/Assignweights/read:02&weights/Initializer/truncated_normal:08
>
bias:0bias/Assignbias/read:02bias/Initializer/zeros:08*~
serving_defaultk
#
input
Reshape_1:0	¨(
output
labels_softmax:0tensorflow/serving/predict