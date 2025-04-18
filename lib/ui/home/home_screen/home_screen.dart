import 'dart:io';

import 'package:contact_app/core/app_assets/app_assets.dart';
import 'package:contact_app/core/app_colors/app_colors.dart';
import 'package:contact_app/ui/common/widgets/custom_text_field.dart';
import 'package:contact_app/ui/home/home_screen/widgets/cart_item.dart';
import 'package:contact_app/ui/home/home_screen/widgets/input_cart_widget.dart';
import 'package:contact_app/ui/home/home_screen/widgets/no_contact_found_widget.dart';
import 'package:contact_app/ui/home/home_screen/widgets/show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../core/model/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppAssets.appLogo,
                width: MediaQuery.of(context).size.width * .3,
              ),
            ),
            Contact.contacts.isEmpty
                ? NoContactFoundWidget()
                : Expanded(
                    child: GridView.builder(
                      itemCount: Contact.contacts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: .7,
                      ),
                      itemBuilder: (context, index) =>
                          CartItem(contact: Contact.contacts[index], onDelete: () {
                           showDialog(context: context, builder: (context) => AlertDialog(
                             title: Text('Are you sure you want to delete this contact ${Contact.contacts[index].name}'),

                             actions: [
                               FilledButton(onPressed: () {
                                 Contact.contacts.removeAt(index);
                                 setState(() {});
                                 Navigator.pop(context);
                               }, child: Text('YES')),
                               FilledButton(onPressed: () {

                                 Navigator.pop(context);
                               }, child: Text('No'))

                             ],
                           ),);
                          },),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: Contact.contacts.isNotEmpty,
            child: FloatingActionButton(
              backgroundColor: AppColor.red,
              foregroundColor: AppColor.gold,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        'Are you sure , if you want to delete all contacts'),
                    actions: [
                      FilledButton(
                          onPressed: () {
                            Contact.contacts.clear();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text('YES')),
                      FilledButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No')),
                    ],
                  ),
                );
              },
              child: Icon(Icons.delete),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: Contact.contacts.length < 4,
            child: FloatingActionButton(
              backgroundColor: AppColor.gold,
              foregroundColor: AppColor.lightBlue,
              onPressed: () {
                _showContactModalBottomSheet();
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactModalBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.lightBlue,
      context: context,
      builder: (context) => ShowModalBottomSheet(),
    );
  }
}
