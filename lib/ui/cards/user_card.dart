import 'package:flutter/material.dart';
import 'package:travel_app/configuration/configuration.dart';
import 'package:travel_app/domain/model/user_info_model/user_info_model.dart';
import 'package:travel_app/ui/navigation/main_navigation.dart';
import 'package:travel_app/ui/pages/event_story/event_story_page.dart';
import 'package:travel_app/ui/theme/colors.dart';

class UserCard extends StatelessWidget {
  final UserInfoModel user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBackground,
      child: Column(
        children: [
          Column(
            children: [
              _avatar(),
              const SizedBox(
                height: 24,
              ),
              _username(),
              const SizedBox(
                height: 12,
              ),
              userCity(context),
              const SizedBox(
                height: 26,
              ),
              _aboutMe(),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _friends(context),
                    const SizedBox(
                      width: 10,
                    ),
                    _numEvents(context),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _avatar() {
    return user.photo_id.isNotEmpty
        ? CircleAvatar(
            radius: 64,
            backgroundColor: Colors.transparent,
            backgroundImage:
                NetworkImage('${Configuration.host}/images/${user.photo_id}'),
          )
        : const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.person),
          );
  }

  Widget _username() {
    return Text(
      '${user.first_name} ${user.last_name} ,${user.age}',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget userCity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            color: Colors.grey,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.location_on)),
        Text(
          user.city,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
        ),
      ],
    );
  }

  Widget _aboutMe() {
    return Container(
        constraints: const BoxConstraints(maxHeight: double.infinity),
        width: 343,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('О себе: ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                  child: Text(
                user.about_me,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ))
            ],
          ),
        ));
  }

  Widget _friends(context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          MainNavigationRouteNames.friendsList,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2.0,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('${user.friends_count}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
          ),
          const Center(
            child: Text(
              'Друзей',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }

  Widget _numEvents(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarEventPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2.0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('${user.visits_count}',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
          ),
          const Center(
            child: Text(
              'Количество посещений',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }
}
