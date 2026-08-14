import 'dart:async';
import 'dart:math';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

class ChatGptExample extends StatefulWidget {
  const ChatGptExample({Key? key}) : super(key: key);
  @override
  State<ChatGptExample> createState() => _ChatGptExampleState();
}

class _ChatGptExampleState extends State<ChatGptExample> {
  /// text controller
  final _txtWord = TextEditingController();

  //! Null when no `OPENAI_TOKEN` dart-define was passed at build time: the SDK
  //! throws `MissingTokenException` on an empty token.
  OpenAI? openAI;

  ///t => translate
  ///! In chat_gpt_sdk 3.x `CTResponse` was renamed to `CompleteResponse`.
  final tController = StreamController<CompleteResponse?>.broadcast();

  void _translateEngToThai() async {
    final openAI = this.openAI;
    if (openAI == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No OpenAI key: rebuild with --dart-define=OPENAI_TOKEN=sk-...',
          ),
        ),
      );
      return;
    }
    try {
      final request = CompleteText(
        prompt: "Translate this into portuguese : ${_txtWord.text}",
        maxTokens: 200,
        //! The model is now a `Model` object instead of a raw string.
        model: Gpt3TurboInstruct(),
      );

      //! `onCompleteStream` was renamed to `onCompletionSSE`.
      openAI.onCompletionSSE(request: request).asBroadcastStream().listen(
        (res) {
          tController.sink.add(res);
        },
      ).onError(
        (err) {
          print("$err");
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    //! `isLogger` is now `enableLog`, and the timeouts are `Duration`s.
    if (token.isNotEmpty) {
      openAI = OpenAI.instance.build(
        token: token,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 6)),
        enableLog: true,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    ///close stream complete text
    tController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /**
                 * title translate
                 */
                _titleCard(size),
                /**
                 * input card
                 * insert your text for translate to th.com
                 */
                _inputCard(size),

                /**
                 * card input translate
                 */
                _resultCard(size),
                /**
                 * button translate
                 */
                _btnTranslate()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _navigation(size),
    );
  }

  Widget _btnTranslate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // ! The `material_buttonx` package is unmaintained (it still reads the
        // ! removed `TextTheme.headline6`), so we use a plain Flutter button.
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SizedBox(
            height: 40.0,
            width: 130.0,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(46.0),
                ),
              ),
              icon: const Icon(Icons.translate, size: 18.0),
              label: const Text('Translate'),
              onPressed: _translateEngToThai,
            ),
          ),
        ),
      ],
    );
  }

  Widget _resultCard(Size size) {
    return StreamBuilder<CompleteResponse?>(
      stream: tController.stream,
      builder: (context, snapshot) {
        final text = snapshot.data?.choices.last.text ?? "Loading...";
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 32.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.bottomCenter,
          width: size.width * .86,
          height: size.height * .3,
          decoration: heroCard,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                SizedBox(
                  width: size.width,
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.copy_outlined,
                        color: Colors.grey,
                        size: 22.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.grey,
                          size: 22.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _navigation(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
      child: Container(
        width: size.width * .8,
        height: size.height * .06,
        decoration: heroNav,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(color: Colors.indigoAccent, borderRadius: BorderRadius.circular(50.0)),
              child: const Icon(
                Icons.translate,
                color: Colors.white,
                size: 22.0,
              ),
            ),
            const Icon(
              Icons.record_voice_over_outlined,
              color: Colors.indigoAccent,
              size: 22.0,
            ),
            const Icon(
              Icons.favorite,
              color: Colors.indigoAccent,
              size: 22.0,
            ),
            const Icon(
              Icons.person,
              color: Colors.indigoAccent,
              size: 22.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _titleCard(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32.0),
      width: size.width * .86,
      height: size.height * .08,
      decoration: heroCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  "https://www.clipartmax.com/png/middle/200-2009207_francais-english-italiano-english-flag-icon-flat.png",
                  fit: BoxFit.cover,
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "Eng",
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ),
              Transform.rotate(
                angle: -pi / 2,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16.0,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              Icons.swap_horiz_outlined,
              color: Colors.grey,
              size: 22.0,
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/197/197452.png",
                  fit: BoxFit.cover,
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "Thai",
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ),
              Transform.rotate(
                angle: -pi / 2,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16.0,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _inputCard(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.bottomCenter,
      width: size.width * .86,
      height: size.height * .25,
      decoration: heroCard,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, enabledBorder: InputBorder.none, disabledBorder: InputBorder.none),
              controller: _txtWord,
              maxLines: 6,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(
              width: size.width,
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.copy_outlined,
                    color: Colors.grey,
                    size: 22.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.record_voice_over_outlined,
                      color: Colors.grey,
                      size: 22.0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
