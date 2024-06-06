import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';
import '../provider/hide_contact_provider.dart';

class hidecontactpage extends StatelessWidget {
  const hidecontactpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hidecontact"),
      ),
      body: Column(
        children: [
          Container(
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
        ],
      ),
    );
  }
}
