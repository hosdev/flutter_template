import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_template/core/features/home/presentation/notificaions/notifications_viewmodel.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder.dart';
import 'package:flutter_template/core/util/sizes.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/widgets/empty_list_widget.dart';
import 'package:flutter_template/core/widgets/primary_appbar.dart';
import 'package:flutter_template/core/widgets/primary_future_builder.dart';
import '../../models/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);
  static String subPath = "notifications";
  static final path = "${NavHolder.path}/$subPath";
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Scaffold(
      appBar: PrimaryAppBar(
        title:  Text(tr.notifications),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final vm = ref.watch(notificationVMProvider);
          return PrimaryFutureBuilder(
            controller: vm.futureController,
            successBuilder: (data) => data.isEmpty?
            EmptyWidget()
            :ListView.separated(
              itemCount: data.length,
              padding: const EdgeInsets.all(AppSizes.bodyPadding),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) =>
                  _NotiCard(notificationModel: data[index]),
            ),
          );
        },
      ),
    );
  }
}

class _NotiCard extends StatelessWidget {
  const _NotiCard({Key? key, required this.notificationModel})
      : super(key: key);

  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF5F8FF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notificationModel.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            notificationModel.description ,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            DateFormat.yMMMMEEEEd()
                .add_jm()
                .format(DateTime.now()),
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xff9698AE)),
          ),
        ],
      ),
    );
  }
}
