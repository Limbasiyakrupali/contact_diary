import 'dart:io';

import 'package:contactdairy/modal/contact.dart';
import 'package:contactdairy/provider/edit_data_provider.dart';
import 'package:contactdairy/provider/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class contactinfo extends StatefulWidget {
  const contactinfo({super.key});

  @override
  State<contactinfo> createState() => _contactinfoState();
}

class _contactinfoState extends State<contactinfo> {
  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Column(children: [
      Column(
        children: [
          Container(
            height: 819,
            width: 500,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Consumer<editdataProvider>(
                          builder: (context, editDataProvider, _) {
                            return Column(
                              children: [
                                // Text(
                                //   "Name: ${editDataProvider.contact.name}",
                                //   style: TextStyle(fontSize: 20),
                                // ),
                                // Text("Email: ${editDataProvider.contact.email}",
                                //     style: TextStyle(fontSize: 20)),
                                // Text(
                                //     "Contact: ${editDataProvider.contact.contact}",
                                //     style: TextStyle(fontSize: 20)),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Edit Information"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                decoration: InputDecoration(
                                                  hintText: "Name",
                                                ),
                                                onChanged: (value) {
                                                  editDataProvider
                                                      .updateContactData(
                                                          newName: "",
                                                          newEmail: "",
                                                          newContact: "");
                                                },
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  hintText: "Email",
                                                ),
                                                onChanged: (value) {
                                                  editDataProvider
                                                    ..updateContactData(
                                                        newName: "",
                                                        newEmail: "",
                                                        newContact: "");
                                                },
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  hintText: "Contact",
                                                ),
                                                onChanged: (value) {
                                                  editDataProvider
                                                    ..updateContactData(
                                                        newName: "",
                                                        newEmail: "",
                                                        newContact: "");
                                                },
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Save"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.star_border),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.more_vert_sharp),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Consumer<imageProvider>(
                    builder: (context, step, _) {
                      return CircleAvatar(
                        radius: 60,
                        backgroundImage: step.pickImagePath != null
                            ? FileImage(File(step.pickImagePath!))
                            : null,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      contact.name,
                      style: GoogleFonts.getFont("Mulish",
                          textStyle: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse("tel:${contact.contact}"));
                            },
                            backgroundColor: Colors.green,
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  "mailto:${contact.email}?subject=Dummy&body="
                                  ""));
                            },
                            backgroundColor: Colors.orange,
                            child: const Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse("sms:${contact.contact}"));
                            },
                            backgroundColor: Colors.purple,
                            child: const Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () async {
                              await ShareExtend.share(
                                  "Name.${contact.name}\nContact:${contact.contact}",
                                  "Text");
                            },
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 150,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Contact Info",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.none)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Icon(Icons.call),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              contact.contact,
                                              style: GoogleFonts.getFont(
                                                  "Mulish",
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      decoration:
                                                          TextDecoration.none)),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 150),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.message,
                                                  size: 26,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 150,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Connected apps",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.none)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(top: 5),
                                          //   child: Icon(Icons.wha),
                                          // ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "WhatsApp",
                                              style: GoogleFonts.getFont(
                                                  "Mulish",
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      decoration:
                                                          TextDecoration.none)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 180),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  size: 35,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    ]);
  }
}
