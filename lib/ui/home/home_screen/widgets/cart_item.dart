import 'package:contact_app/core/model/contact_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.contact,required this.onDelete});

  final Contact contact;
final void Function() onDelete ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
              child: Image.file(contact.image,fit: BoxFit.cover,))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _contactInfo(Icons.email, contact.email),
              _contactInfo(Icons.person, contact.name),
              FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  onPressed: () {
                    onDelete();
                  }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DELETE')
                ],
              ))

            ],
          ),
        )
        ],
      ),
    );
  }

  Widget _contactInfo(IconData icon,String name){
    return Row(
      children: [
      Icon(icon )  ,
        SizedBox(width: 10,),
        Text(name)
      ],
    );
  }
}
