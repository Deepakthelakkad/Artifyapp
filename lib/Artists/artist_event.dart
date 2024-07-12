import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class ArtistEvent extends StatefulWidget {
  @override
  _ArtistEventState createState() => _ArtistEventState();
}

class _ArtistEventState extends State<ArtistEvent> {
  final formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  var ID;

  void initState() {
    super.initState();
    getData();
  }

  var Vname = TextEditingController();
  var searchController = TextEditingController();
  String searchQuery = "";

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      print(ID.toString());
    });
    print('data updated');
  }

  Future<void> _pickAndUploadVideo() async {
    setState(() {
      _isLoading = true;
    });

    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      final file = result.files.first;
      final filePath = file.path;

      if (filePath != null) {
        final fileName = file.name;
        final fileRef =
        FirebaseStorage.instance.ref().child('videos/$fileName');
        final uploadTask = fileRef.putFile(File(filePath));

        final snapshot = await uploadTask.whenComplete(() => {});
        final downloadUrl = await snapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('videos').add({
          'url': downloadUrl,
          'name': fileName,
          'uploaded_at': Timestamp.now(),
          'artistId': ID,
          'videoname': Vname.text
        });

        setState(() {
          _isLoading = false;
        });

        print("done");
        Vname.clear();
        Navigator.of(context).pop();
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Color.fromRGBO(191, 68, 116, 1),
                  size: 23,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text(
                  'Events',
                  style: TextStyle(color: Color.fromRGBO(191, 68, 116, 1)),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search by video name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('videos')
                    .where('artistId', isEqualTo: ID)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final videos = snapshot.data?.docs ?? [];
                  final filteredVideos = videos.where((video) {
                    final videoName = video['videoname'].toLowerCase();
                    return videoName.contains(searchQuery);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredVideos.length,
                    itemBuilder: (context, index) {
                      final video = filteredVideos[index];
                      final url = video['url'];

                      return ListTile(
                        title: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(75, 115, 136, 1.0),
                            image: DecorationImage(
                              image: AssetImage("assets/event.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 140, left: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 335,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromRGBO(57, 79, 117, 1.0),
                                        Color.fromRGBO(23, 124, 145, 1),
                                      ],
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Icon(Icons.video_library,
                                                color: Colors.white),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                video['videoname'],
                                                style: TextStyle(
                                                    color: Colors.white),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VideoPlayerPage(url: url),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.upload),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  title: Text(
                    "Enter video name",
                    style: TextStyle(color: Colors.blue),
                  ),
                  content: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: Vname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'empty file';
                      }
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        hintText: "Enter here"),
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            _pickAndUploadVideo();
                            setState(() {
                              _isLoading = true;
                            });
                          }
                        },
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String url;

  VideoPlayerPage({required this.url});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
