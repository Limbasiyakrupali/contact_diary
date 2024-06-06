import 'dart:io';

import 'package:contactdairy/provider/contact_provider.dart';
import 'package:contactdairy/provider/hide_contact_provider.dart';
import 'package:contactdairy/provider/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../provider/stepper_provider.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<StepperProvider>(context, listen: false)
              .namecontroller
              .clear();
          Provider.of<StepperProvider>(context, listen: false)
              .contactcontroller
              .clear();
          Provider.of<StepperProvider>(context, listen: false)
              .emailcontroller
              .clear();
          Provider.of<StepperProvider>(context, listen: false).step = 0;

          showDialog(
              context: context,
              builder: (context) {
                return const AlertBox();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.10,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Icon(
                                    Icons.search_rounded,
                                    size: 25,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Search",
                                    style: GoogleFonts.getFont("Mulish",
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 155),
                                  child: Icon(Icons.more_vert_sharp),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.purple,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 6),
                                      child: Text(
                                        "K",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // AlphabetScrollView(
                  //   unselectedTextStyle: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.normal,
                  //       color: Colors.black),
                  //   selectedTextStyle: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.red),
                  //   list: Provider.of<ContactProvider>(context)
                  //       .allContact
                  //       .map((e) => AlphaModel(e.name))
                  //       .toList(),
                  //   itemExtent: 100,
                  //   itemBuilder: (context, i, name) {
                  //     return Container(
                  //       //color: Colors.red,
                  //       child: Consumer<ContactProvider>(
                  //         builder: (context, contactsProvider, _) {
                  //           return Slidable(
                  //             startActionPane: ActionPane(
                  //               motion: DrawerMotion(),
                  //               children: [
                  //                 SlidableAction(
                  //                   onPressed: (val) {
                  //                     Provider.of<HideContactProvider>(context,
                  //                             listen: false)
                  //                         .addcontact(
                  //                             Provider.of<ContactProvider>(
                  //                                     context)
                  //                                 .allContact[i]);
                  //                     Provider.of<ContactProvider>(context,
                  //                             listen: false)
                  //                         .removeContact(
                  //                             Provider.of<ContactProvider>(
                  //                                     context)
                  //                                 .allContact[i]);
                  //                   },
                  //                   icon: Icons.archive_outlined,
                  //                 ),
                  //               ],
                  //             ),
                  //             endActionPane: ActionPane(
                  //               motion: DrawerMotion(),
                  //               children: [
                  //                 SlidableAction(
                  //                   onPressed: (val) {
                  //                     Provider.of<ContactProvider>(context,
                  //                             listen: false)
                  //                         .removeContact(
                  //                             Provider.of<ContactProvider>(
                  //                                     context)
                  //                                 .allContact[i]);
                  //                   },
                  //                   icon: CupertinoIcons.delete,
                  //                 ),
                  //               ],
                  //             ),
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 Navigator.of(context).pushNamed('detailPage',
                  //                     arguments: Provider.of<ContactProvider>(
                  //                             context,
                  //                             listen: false)
                  //                         .allContact[i]);
                  //               },
                  //               child: Card(
                  //                 elevation: 3,
                  //                 margin: EdgeInsets.only(
                  //                     left: 20, right: 20, bottom: 20),
                  //                 child: ListTile(
                  //                   title: Row(
                  //                     children: [
                  //                       Consumer<imageProvider>(
                  //                           builder: (context, step, _) {
                  //                         return CircleAvatar(
                  //                           radius: 25,
                  //                         );
                  //                       }),
                  //                       SizedBox(
                  //                         width: 10,
                  //                       ),
                  //                       Text(
                  //                         name,
                  //                         style: TextStyle(fontSize: 15),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   // subtitle: Text(
                  //                   //   e.contact,
                  //                   //   style: TextStyle(fontSize: 13),
                  //                   // ),
                  //                   // trailing: IconButton(
                  //                   //   onPressed: () async {
                  //                   //     await launchUrl(Uri.parse(
                  //                   //         "tel:${Provider.of<ContactProvider>(context).allContact[i].contact}"));
                  //                   //   },
                  //                   //   icon: Icon(
                  //                   //     Icons.phone,
                  //                   //     color: Colors.green,
                  //                   //   ),
                  //                   // ),
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "krupalilimbasiya0@gmail.com",
                                style: GoogleFonts.getFont("Mulish",
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 28,
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Icon(Icons.filter_list),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed("hidecontact");
                                    },
                                    child: IconButton(
                                      onPressed: () async {
                                        final LocalAuthentication auth =
                                            LocalAuthentication();
                                        bool isAuth = await auth.authenticate(
                                            localizedReason:
                                                "Please authenticate to show account balance",
                                            options:
                                                const AuthenticationOptions());
                                        if (isAuth) {
                                          Navigator.of(context)
                                              .pushNamed("hidecontact");
                                        } else {
                                          print(
                                              "your authentication is failed");
                                        }
                                      },
                                      icon: Icon(Icons.archive_outlined),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // AlphabetScrollView(
          //   unselectedTextStyle: TextStyle(
          //       fontSize: 18,
          //       fontWeight: FontWeight.normal,
          //       color: Colors.black),
          //   selectedTextStyle: TextStyle(
          //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          //   list: Provider.of<ContactProvider>(context)
          //       .allContact
          //       .map((e) => AlphaModel(e.name))
          //       .toList(),
          //   itemExtent: 100,
          //   itemBuilder: (context, i, name) {
          //     return Container(
          //       //color: Colors.red,
          //       child: Consumer<ContactProvider>(
          //         builder: (context, contactsProvider, _) {
          //           return Slidable(
          //             startActionPane: ActionPane(
          //               motion: DrawerMotion(),
          //               children: [
          //                 SlidableAction(
          //                   onPressed: (val) {
          //                     Provider.of<HideContactProvider>(context,
          //                             listen: false)
          //                         .addcontact(
          //                             Provider.of<ContactProvider>(context)
          //                                 .allContact[i]);
          //                     Provider.of<ContactProvider>(context,
          //                             listen: false)
          //                         .removeContact(
          //                             Provider.of<ContactProvider>(context)
          //                                 .allContact[i]);
          //                   },
          //                   icon: Icons.archive_outlined,
          //                 ),
          //               ],
          //             ),
          //             endActionPane: ActionPane(
          //               motion: DrawerMotion(),
          //               children: [
          //                 SlidableAction(
          //                   onPressed: (val) {
          //                     Provider.of<ContactProvider>(context,
          //                             listen: false)
          //                         .removeContact(
          //                             Provider.of<ContactProvider>(context)
          //                                 .allContact[i]);
          //                   },
          //                   icon: CupertinoIcons.delete,
          //                 ),
          //               ],
          //             ),
          //             child: GestureDetector(
          //               onTap: () {
          //                 Navigator.of(context).pushNamed('detailPage',
          //                     arguments: Provider.of<ContactProvider>(context,
          //                             listen: false)
          //                         .allContact[i]);
          //               },
          //               child: Card(
          //                 elevation: 3,
          //                 margin:
          //                     EdgeInsets.only(left: 20, right: 20, bottom: 20),
          //                 child: ListTile(
          //                   title: Row(
          //                     children: [
          //                       Consumer<imageProvider>(
          //                           builder: (context, step, _) {
          //                         return CircleAvatar(
          //                           radius: 25,
          //                         );
          //                       }),
          //                       SizedBox(
          //                         width: 10,
          //                       ),
          //                       Text(
          //                         name,
          //                         style: TextStyle(fontSize: 15),
          //                       ),
          //                     ],
          //                   ),
          //                   // subtitle: Text(
          //                   //   e.contact,
          //                   //   style: TextStyle(fontSize: 13),
          //                   // ),
          //                   // trailing: IconButton(
          //                   //   onPressed: () async {
          //                   //     await launchUrl(Uri.parse(
          //                   //         "tel:${Provider.of<ContactProvider>(context).allContact[i].contact}"));
          //                   //   },
          //                   //   icon: Icon(
          //                   //     Icons.phone,
          //                   //     color: Colors.green,
          //                   //   ),
          //                   // ),
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
          Expanded(
            flex: 9,
            child: Container(
              child: Consumer<ContactProvider>(
                builder: (context, contactProvider, _) {
                  return ListView(
                    children: contactProvider.allContact.map((e) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("detailpage", arguments: e);
                        },
                        child: ListTile(
                          title: Text(e.name),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text(e.contact),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Text(e.email),
                              //   ],
                              // )
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              // await launchUrl(
                              //     Uri.parse("tel:${}")
                              // );
                            },
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // const Icon(
                                //   Icons.phone,
                                //   color: Colors.green,
                                // ),
                                SizedBox(width: 30),
                                PopupMenuButton(
                                    itemBuilder: (context) {
                                      return <PopupMenuEntry>[
                                        PopupMenuItem(
                                            onTap: () {
                                              Provider.of<HideContactProvider>(
                                                      context,
                                                      listen: false)
                                                  .addcontact(e);
                                              Provider.of<HideContactProvider>(
                                                      context,
                                                      listen: false)
                                                  .removecontact(e);
                                            },
                                            child: Text("Hide")),
                                        PopupMenuItem(
                                            onTap: () {
                                              Provider.of<HideContactProvider>(
                                                      context,
                                                      listen: false)
                                                  .addcontact(e);
                                              Provider.of<HideContactProvider>(
                                                      context,
                                                      listen: false)
                                                  .removecontact(e);
                                            },
                                            child: Text("Delete")),
                                      ];
                                    },
                                    child: Icon(Icons.more_vert_sharp)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
                child: const Column(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    XFile? xFile;
    String? pickImagePath;

    return SingleChildScrollView(
      child: Column(
        children: [
          AlertDialog(
            title: Text("Create Contact"),
            content: Container(
              height: 600,
              width: 300,
              child: Column(children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Pick Image"),
                                content: const Text(
                                  "Choose Image From Gallery or Camera",
                                ),
                                actions: [
                                  Consumer<imageProvider>(
                                      builder: (context, imagespro, _) {
                                    return FloatingActionButton(
                                      mini: true,
                                      elevation: 3,
                                      onPressed: () {
                                        Provider.of<imageProvider>(context,
                                                listen: false)
                                            .pickImage();
                                      },
                                      child: Icon(Icons.camera),
                                    );
                                  }),
                                  Consumer<imageProvider>(
                                      builder: (context, imagespro, _) {
                                    return FloatingActionButton(
                                        mini: true,
                                        elevation: 3,
                                        onPressed: () {
                                          Provider.of<imageProvider>(context,
                                                  listen: false)
                                              .pickImage();
                                        },
                                        child: Icon(Icons.add));
                                  }),
                                ],
                              );
                            });
                      },
                      child: Consumer<imageProvider>(
                        builder: (context, step, _) {
                          return CircleAvatar(
                            radius: 60,
                            backgroundImage: step.pickImagePath != null
                                ? FileImage(File(step.pickImagePath!))
                                : null,
                            child: Icon(Icons.image),
                          );
                        },
                      ),
                    ),
                    Consumer<StepperProvider>(
                      builder: (context, stepProvider, _) {
                        return Stepper(
                          currentStep: stepProvider.step,
                          controlsBuilder: (context, _) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      stepProvider.forwardstep(context);
                                    },
                                    child: Text(stepProvider.step == 2
                                        ? "Save"
                                        : "Next"),
                                  ),
                                  if (stepProvider.step != 0)
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: OutlinedButton(
                                        onPressed: stepProvider.backward,
                                        child: const Text("Cancel"),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                          steps: [
                            Step(
                              title: const Text("Name"),
                              content: SizedBox(
                                height: 40,
                                width: 350,
                                child: TextField(
                                  controller: stepProvider.namecontroller,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Step(
                              title: const Text("Contact"),
                              content: SizedBox(
                                height: 40,
                                width: 350,
                                child: TextField(
                                  controller: stepProvider.contactcontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Step(
                              title: Text("Email"),
                              content: SizedBox(
                                height: 40,
                                width: 350,
                                child: TextField(
                                  controller: stepProvider.emailcontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
