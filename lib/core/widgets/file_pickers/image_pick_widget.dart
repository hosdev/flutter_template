import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_template/core/services/file_picker.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/util/gen/assets.gen.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:video_player/video_player.dart';
import '../../data/api/api_requests.dart';
import '../../theme/text_theme.dart';
import '../../ui_helper/toast.dart';
import '../../util/sizes.dart';
import '../loading_widget.dart';

Future<int?> imageTypePick(context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () => Navigator.pop(context, 0),
                leading: const Icon(Icons.camera),
                title: Text("Take Photo"),
              ),
              ListTile(
                onTap: () => Navigator.pop(context, 1),
                leading: const Icon(Icons.image_outlined),
                title: Text("Pick From Gallery"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class PickLogoWidget extends FormField<UploadFileHelper> {
  PickLogoWidget(
      {Key? key,
      FormFieldSetter<UploadFileHelper>? onSaved,
      FormFieldValidator<UploadFileHelper>? validator,
      UploadFileHelper? initialValue,
      String? title,
      String? oldUrl,
      AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autoValidate,
            builder: (FormFieldState<UploadFileHelper> state) {
              final tr = state.context.tr;

              return GestureDetector(
                onTap: () async {
                  final src = await imageTypePick(state.context);
                  if (src != null) {
                    final res = await AppFilePicker.pickImage(src);
                    if (res != null) {
                      state.didChange(res);
                      state.save();
                    }
                  }
                },
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 58.r,
                        backgroundColor:
                            state.context.appColors.primary.shade100,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              radius: 55.r,
                              backgroundImage: (state.value != null
                                  ? FileImage(File(state.value!.path ?? ''))
                                  : oldUrl != null
                                      ? NetworkImage(oldUrl)
                                      : null) as ImageProvider<Object>?,
                              child: state.value == null && oldUrl == null
                                  ? Padding(
                                      padding:  EdgeInsets.all(8.0.w),
                                      child: Center(
                                        child:  Icon(
                                          Icons.add_a_photo_outlined,
                                          size: 30.h,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        )),
                    state.hasError
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.errorText ?? tr.addImage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              );
            });
}

class PickImageWidget extends FormField<UploadFileHelper> {
  PickImageWidget(
      {Key? key,
      FormFieldSetter<UploadFileHelper>? onSaved,
      FormFieldValidator<UploadFileHelper>? validator,
      UploadFileHelper? initialValue,
      String? title,
      String? oldUrl,
      AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autoValidate,
            builder: (FormFieldState<UploadFileHelper> state) {
              final tr = state.context.tr;
              return GestureDetector(
                onTap: () async {
                  final src = await imageTypePick(state.context);
                  if (src != null) {
                    final res = await AppFilePicker.pickImage(src);
                    if (res != null) {
                      state.didChange(res);
                      state.save();
                    }
                  }
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: state.context.appColors.surface,
                      borderRadius: BorderRadius.circular(15)),
                  child: state.value != null || oldUrl != null
                      ? SizedBox(
                          width: AppSizes.getDeviceWidth(state.context),
                          height: AppSizes.getDeviceWidth(state.context),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: state.value != null
                                    ? Image.file(
                                        File(state.value!.path ?? ''),
                                        fit: BoxFit.cover,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: oldUrl!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(8.0.w),
                                child: CircleAvatar(
                                  backgroundColor:
                                      state.context.appColors.primary.shade500,
                                  radius: 12.r,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SvgPicture.asset(
                                        Assets.iconly.curved.editSquare,height: 24.h,width: 24.h,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Assets.iconly.curved.image,height: 24.h,
                                  color: state.context.appColors.subText),
                              const SizedBox(
                                height: 10,
                              ),
                              state.hasError
                                  ? Text(
                                      state.errorText ?? tr.fieldRequired,
                                      textAlign: TextAlign.center,
                                      style: TypographyAppRegular.bodyS
                                          .copyWith(color: Colors.red),
                                    )
                                  : Text(
                                      title ?? tr.logo,
                                      textAlign: TextAlign.center,
                                      style: TypographyAppRegular.bodyS
                                          .copyWith(
                                              color: state
                                                  .context.appColors.subText),
                                    ),
                            ],
                          ),
                        ),
                ),
              );
            });
}

class PickVideoWidget extends FormField<UploadFileHelper> {
  PickVideoWidget(
      {Key? key,
      FormFieldSetter<UploadFileHelper>? onSaved,
      FormFieldValidator<UploadFileHelper>? validator,
      UploadFileHelper? initialValue,
      String? title,
      AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autoValidate,
            builder: (FormFieldState<UploadFileHelper> state) {
              final tr = state.context.tr;
              return GestureDetector(
                onTap: () async {
                  final src = await imageTypePick(state.context);
                  if (src != null) {
                    final res = await AppFilePicker.pickVideo(src);
                    if (res != null) {
                      state.didChange(res);
                      state.save();
                    }
                  }
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: state.context.appColors.surface,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: state.value == null
                      ? Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Assets.iconly.curved.video,height: 24.h,
                                  color: state.context.appColors.subText),
                               SizedBox(
                                height: 10,
                              ),
                              state.hasError
                                  ? Text(
                                      state.errorText ?? tr.fieldRequired,
                                      textAlign: TextAlign.center,
                                      style: TypographyAppRegular.bodyS
                                          .copyWith(color: Colors.red),
                                    )
                                  : Text(
                                      title ?? tr.logo,
                                      textAlign: TextAlign.center,
                                      style: TypographyAppRegular.bodyS
                                          .copyWith(
                                              color: state
                                                  .context.appColors.subText),
                                    ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: AppSizes.getDeviceWidth(state.context),
                          height: AppSizes.getDeviceWidth(state.context),
                          child: ClipRRect(
                            child: Stack(
                              children: [
                                VideoFieldWidget(
                                    isNetwork: false,
                                    reelsVideo: state.value!.path ?? ""),
                                Padding(
                                  padding:  EdgeInsets.all(8.0.w),
                                  child: CircleAvatar(
                                    backgroundColor: state
                                        .context.appColors.primary.shade500,
                                    radius: 12,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SvgPicture.asset(
                                          Assets.iconly.curved.editSquare,height: 24.h,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              );
            });
}

class VideoFieldWidget extends StatefulWidget {
  const VideoFieldWidget({
    super.key,
    required this.reelsVideo,
    required this.isNetwork,
  });
  final String reelsVideo;
  final bool isNetwork;

  @override
  State<VideoFieldWidget> createState() => _VideoFieldWidgetState();
}

class _VideoFieldWidgetState extends State<VideoFieldWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isNetwork) {
      _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.reelsVideo),
          videoPlayerOptions:
              VideoPlayerOptions(allowBackgroundPlayback: false))
        ..setLooping(true)
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      _controller = VideoPlayerController.file(File(widget.reelsVideo),
          videoPlayerOptions:
              VideoPlayerOptions(allowBackgroundPlayback: false))
        ..setLooping(true)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : LoadingWidget(),
        ),
      ],
    );
  }
}
