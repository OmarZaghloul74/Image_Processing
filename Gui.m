function varargout = Gui(varargin)
% GUI MATLAB code for Gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui

% Last Modified by GUIDE v2.5 20-Dec-2022 22:48:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Gui is made visible.
function Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui (see VARARGIN)

% Choose default command line output for Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function hist_original_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
histo=a;
axes(handles.axes3)
histogram_rgb_gray(histo)

% --- Executes on button press in stretching.
function stretching_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
new_image=a;
axes(handles.axes3)
contrast_stretching(new_image)

% --- Executes on button press in histequalization.
function histequalization_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image=a;
axes(handles.axes3)
histogram_equalization( image )

% --- Executes on button press in fourier_transform_btn.
function rgb_to_gray_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
rgbtogray(img);

% --- Executes on button press in Gray_to_binary.
function Gray_to_binary_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
gray=graytobinary(a);
axes(handles.axes3);
imshow(gray)
setappdata(0,'filename',gray);

% --- Executes on button press in import_image.
function import_image_Callback(hObject, eventdata, handles)

a=uigetfile('*.*');
filename=a; 
setappdata(0,'filename',filename); 
a=imread(a); 
axes(handles.axes1); 
imshow(a); 
setappdata(0,'a',a) 
setappdata(0,'filename',a); 
plot(handles.axes1,'a')

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)

cla(handles.axes1,'reset')
cla(handles.axes3,'reset')  

% --- Executes on button press in z.
function z_Callback(hObject, eventdata, handles)

cla(handles.axes3,'reset')

% --- Executes on button press in LOG_btn.
function LOG_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image=LoG(a);
axes(handles.axes3);
imshow(image)
setappdata(0,'filename',image);

% --- Executes on button press in Inverse_log_btn.
function Inverse_log_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image= Inverse_LoG(a);
axes(handles.axes3);
imshow(image)
setappdata(0,'filename',image);

% --- Executes on button press in complement_btn.
function complement_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
complement( img);

% --- Executes on button press in root_btn.
function root_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image= root(a);
axes(handles.axes3);
imshow(image)
setappdata(0,'filename',image);

% --- Executes on button press in power_btn.
function power_btn_Callback(hObject, eventdata, handles)

value = str2double(get ( handles.transform_value_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
image= powers(a,value);
c=powers(image,value);
plot(c);
setappdata(0,'filename',image);
imshow(image)

% --- Executes on button press in horizontal_sharp_btn.
function horizontal_sharp_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
horizontal(img);

% --- Executes on button press in vertical_sharp_btn.
function vertical_sharp_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
vertical(img);

% --- Executes on button press in right_sharp_btn.
function right_sharp_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
right_diagonal(img);

% --- Executes on button press in left_sharp_btn.
function left_sharp_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
left_diagonal(img);

% --- Executes on button press in horizontal_sharp_btn.
function Horizontal_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
horizontal_sobel(img);

% --- Executes on button press in vertical_sharp_btn.
function vertical_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
vertical_sobel(img);

% --- Executes on button press in right_sobel_btn.
function right_sobel_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
right_diagonal_sobel(img);

% --- Executes on button press in lest_sobel_btn.
function lest_sobel_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
left_diagonal_sobel(img);

% --- Executes on button press in horizontal_robert_btn.
function horizontal_robert_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
horizontal_robert(img);

% --- Executes on button press in vertical_robert_btn.
function vertical_robert_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
vertical_robert(img);

% --- Executes on button press in right_robert_btn.
function right_robert_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
right_robert(img)

% --- Executes on button press in left_robert_btn.
function left_robert_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
left_robert(img)

% --- Executes on button press in point_sharp_btn.
function point_sharp_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
pointSharpining(img);

% --- Executes on button press in min_btn.
function min_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3) 
minnn_filter(img);

% --- Executes on button press in max_btn.
function max_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image=a;
axes(handles.axes3)
MAX_Filter(image);

% --- Executes on button press in mid_point_btn.
function mid_point_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
 MidPoint(img);

% --- Executes on button press in mid_point_btn.
function median_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
old_image=a;
axes(handles.axes3)
Avarage_Filter( old_image );

% --- Executes on button press in fourier_btn.
function fourier_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image=a;
axes(handles.axes3)
fourier_transform(image);

% --- Executes on button press in inverse_fourier_btn.
function inverse_fourier_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
image=a;
axes(handles.axes3)
inverse_fourier_transform(image);

% --- Executes on button press in weight_btn.
function weight_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
old_image=a;
axes(handles.axes3)
weight( old_image );

% --- Executes on button press in median.
function median_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
imag=a;
axes(handles.axes3)
Median_filter( imag );

% --- Executes on button press in mean_btn.
function mean_btn_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
old_image=a;
axes(handles.axes3)
Avarage_Filter( old_image );

% --- Executes on button press in ideal_low_btn.
function ideal_low_btn_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.D0_edit,'string'));
value2 = str2double(get ( handles.index_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= idealow( a,value1,value2 );
c=idealow(I,value1,value2);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in guassian_low_btn.
function guassian_low_btn_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.D0_edit,'string'));
value2 = str2double(get ( handles.index_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= gaussianlow( a,value1,value2 );
c=gaussianlow(I,value1,value2);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in butterworth_low_btn.
function butterworth_low_btn_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.D0_edit,'string'));
value2 = str2double(get ( handles.index_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= butterworthlow( a,value1 ,value2);
c=butterworthlow(I,value1,value2);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in ideal_high.
function ideal_high_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.D0_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= idealhigh( a,value1);
c=idealhigh(I,value1);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in guassian_high_btn.
function guassian_high_btn_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.D0_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= gaussianhigh( a,value1 );
c=gaussianhigh(I,value1);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in butterworth_low_btn.
function butterworth_high_btn_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.D0_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= gaussianhigh( a,value1 );
c=gaussianhigh(I,value1);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in salt_pepper.
function salt_pepper_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.value1_edit,'string'));
value2 = str2double(get ( handles.value2_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
I= Bipoler_SaltandPepper_Noise( a,value1,value2 );
c=Bipoler_SaltandPepper_Noise(I,value1,value2);
plot(c);
setappdata(0,'filename',I);
imshow(I)

% --- Executes on button press in gaussian_noise.
function gaussian_noise_Callback(hObject, eventdata, handles)
value1 = str2double(get ( handles.value1_edit,'string'));
value2 = str2double(get ( handles.value2_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
image= Gaussian_Normal_Noise( a,value1,value2 );
c= Gaussian_Normal_Noise(image,value1,value2);
plot(c);
setappdata(0,'filename',image);
imshow(image)

% --- Executes on button press in exponential_noise.
function exponential_noise_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.value1_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
image= Exponential_Noise( a,value1);
c= Exponential_Noise(image,value1);
plot(c);
setappdata(0,'filename',image);
imshow(image)

% --- Executes on button press in uniform_noise.
function uniform_noise_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.value1_edit,'string'));
value2 = str2double(get ( handles.value2_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
image= Uniform_Noise( a,value1,value2 );
c=  Unifor_Noise(image,value1,value2);
plot(c);
setappdata(0,'filename',image);
imshow(image)
% --- Executes on button press in gamma_noise.
function gamma_noise_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.value1_edit,'string'));
value2 = str2double(get ( handles.value2_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
image= Gamma_Noise( a,value1,value2 );
c= Gamma_Noise(image,value1,value2);
plot(c);
setappdata(0,'filename',image);
imshow(image)
% --- Executes on button press in reyleigh_noise.
function reyleigh_noise_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.value1_edit,'string')); 
value2 = str2double(get ( handles.value2_edit,'string')); 
a=getappdata(0,'a'); 
axes(handles.axes3); 
img= rayligh_noisse( a,value1,value2 ); 
c= rayligh_noisse(img,value1,value2); 
plot(c); 
setappdata(0,'filename',img); 
imshow(img)

% --- Executes on button press in brightness.
function brightness_Callback(hObject, eventdata, handles)

value1 = str2double(get ( handles.offset_btn,'string'));
value2 = str2double(get ( handles.option_edit,'string'));
a=getappdata(0,'a');
axes(handles.axes3);
gray= Brightness( a,value1,value2 );
c=Brightness(gray,value1,value2);
plot(c);
setappdata(0,'filename',gray);
imshow(gray)

% --- Executes on button press in horizontal_sharp_btn.
function pointdetection_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
img=a;
axes(handles.axes3)
pointdetection(img)


% --- Executes on button press in correlation.
function correlation_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
old_image=a;
axes(handles.axes3)
correlation(old_image)

% --- Executes on button press in convolution.
function convolution_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
old_image=a;
axes(handles.axes3)
convlution(old_image)

function option_edit_Callback(hObject, eventdata, handles)


function offset_btn_Callback(hObject, eventdata, handles)


function value1_edit_Callback(hObject, eventdata, handles)


function value2_edit_Callback(hObject, eventdata, handles)


function D0_edit_Callback(hObject, eventdata, handles)


function index_edit_Callback(hObject, eventdata, handles)
