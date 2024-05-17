import 'package:flutter/material.dart';
import 'package:trueque_tech/themes/colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemBuilder: (context, index) {
        return listViewItem(index);
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Divider(
            height: 0,
            thickness: 0.3,
            color: Colors.grey,
          ),
        );
      },
      itemCount: 9,
    ));
  }

  Widget listViewItem(int index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.only(right: 2, top: 13, bottom: 13),
          child: Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage('assets/jhonmarston.jpg'),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jhon Marston',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Guess about all i got left now is doubts. doubts and scars',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              )),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          AppColors.sinDefinir01,
                          AppColors.sinDefinir04
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                child: Text(
                  '99',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
      background: Container(
        padding: EdgeInsets.only(right: 15),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12),
          ),
          color: AppColors.sinDefinir03,
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
