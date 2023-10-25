import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'asset/images/wix_logo.png',
                    width: 100,
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          const Text('관리자 로그인'),
                          Container(
                            height: 3,
                            width: 85,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          const Text('직원 로그인'),
                          Container(
                            height: 4,
                            width: 75,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('아이디'),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('비밀번호'),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () => {},
                            child: const Text(
                              '아이디 찾기 / 비밀번호 찾기',
                              style: TextStyle(color: Colors.grey),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '포인티 계정이 없으세요? | ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () => {},
                            child: const Text(
                              '회원가입',
                              style: TextStyle(color: Colors.grey),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: ElevatedButton(
                        onPressed: () => context.go('/main'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.grey.shade300, // Background color
                        ),
                        child: const Text(
                          '로그인',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
