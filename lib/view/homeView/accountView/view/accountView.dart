import 'package:gt_tbb/core/commonWidget/commonAppbar.dart';
import 'package:gt_tbb/core/commonWidget/profileTileWidget.dart';
import 'package:gt_tbb/view/homeView/accountView/view/privacyPolicyView.dart';
import 'package:gt_tbb/view/homeView/accountView/view/subscriptionView.dart';
import 'package:gt_tbb/view/homeView/accountView/view/termsConditionView.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../core/utils/import_list.dart';
import '../widget/alertDialog.dart';
import '../widget/alertPreferenceCard.dart';
import '../widget/alertShowcaseWidget.dart';
import '../widget/notificationWidget.dart';
import 'changePasswordView.dart';
import 'editProfileView.dart';
import 'groupMemberView.dart';
import 'notificationView.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) => Scaffold(
        appBar: CommonAppbar(
          title: "Account",
          rightIcon: AppImages.notification,
          onRightIconTap: () => Get.to(() => NotificationView()),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.mainColor,
                      child: CircleAvatar(
                        radius: 47,
                        backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),

                  heightBox10,
                  Center(
                    child: CustomText(
                      text: "Emma Johnson",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Center(
                    child: CustomText(
                      text: "Mother",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  heightBox20,

                  //Profile
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0XFFD9D9D9),
                          width: 0.60,
                        )),
                    child: Column(
                      children: [
                        ProfileTileWidget(
                          imagePath: AppImages.edit,
                          title: "Edit Profile",
                          onTap: () => Get.to(() => EditProfileView()),
                        ),
                        Divider(
                          thickness: 0.25,
                        ),


                        ProfileTileWidget(
                          imagePath: AppImages.alert,
                          title: "Remainder Alert",
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (dialogContext) => RemainderAlertWithShowcase(
                                onShowcaseComplete: () {
                                  Navigator.pop(dialogContext);

                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertPreferenceCard(),
                                  );
                                },
                              ),
                            );
                          },
                        ),

                        Divider(
                          thickness: 0.25,
                        ),

                        // Notification Toggle with Intro
                        NotificationWidget(
                          imagePath: AppImages.notification,
                          title: 'Push Notifications',
                        ),
                      ],
                    ),
                  ),

                  heightBox20,

                  //Privacy and Security
                  Container(
                    padding: EdgeInsets.all(6),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0XFFD9D9D9),
                          width: 0.60,
                        )),
                    child: Column(
                      children: [
                        heightBox8,
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset(AppImages.security),
                            ),
                            widthBox14,
                            CustomText(
                              text: 'Privacy & Security',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor,
                            )
                          ],
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        heightBox10,
                        ProfileTileWidget(
                          imagePath: AppImages.security,
                          title: "Privacy Policy",
                          onTap: () => Get.to(() => PrivacyPolicyView()),
                        ),
                        Divider(
                          thickness: 0.25,
                        ),
                        ProfileTileWidget(
                          imagePath: AppImages.password,
                          title: "Change Password",
                          onTap: () => Get.to(() => ChangePasswordView()),
                        ),
                        Divider(
                          thickness: 0.25,
                        ),
                        ProfileTileWidget(
                          imagePath: AppImages.terms,
                          title: "Terms & Condition",
                          onTap: () => Get.to(() => TermsConditionView()),
                        ),
                      ],
                    ),
                  ),

                  heightBox20,

                  //App
                  Container(
                    padding: EdgeInsets.all(6),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0XFFD9D9D9),
                          width: 0.60,
                        )),
                    child: Column(
                      children: [
                        heightBox8,
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset(AppImages.app),
                            ),
                            widthBox14,
                            CustomText(
                              text: 'App',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor,
                            )
                          ],
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        heightBox10,
                        ProfileTileWidget(
                          imagePath: AppImages.family,
                          title: "Group Member",
                          onTap: () => Get.to(() => GroupMemberView()),
                        ),
                        Divider(
                          thickness: 0.25,
                        ),
                        ProfileTileWidget(
                          imagePath: AppImages.subscription,
                          title: "Manage Subscription",
                          onTap: () => Get.to(() => ManageSubscriptionView()),
                        ),
                        Divider(
                          thickness: 0.25,
                        ),
                        ProfileTileWidget(
                          imagePath: AppImages.delete,
                          title: "Delete Account",
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ProfileAlertDialog(
                                imagePath: AppImages.deleteAccount,
                                subTitle:
                                "Are you sure you want to delete your account?",
                                onAccept: () => print('Hello'),
                                onDeny: () => print('Hello'),
                              ),
                            );
                          },
                        ),
                        Divider(
                          thickness: 0.25,
                        ),
                        ProfileTileWidget(
                          imagePath: AppImages.logOut,
                          title: "Log Out",
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ProfileAlertDialog(
                                imagePath: AppImages.logOutIcon,
                                subTitle:
                                "Are you sure you want to Log Out your account?",
                                onAccept: () => print('Hello'),
                                onDeny: () => print('Hello'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}