// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_portfolio/core/extensions/widget_ex.dart';


// class CodeBlock extends StatefulWidget {
//   const CodeBlock({Key? key}) : super(key: key);

//   @override
//   State<CodeBlock> createState() => _CodeBlockState();
// }

// class _CodeBlockState extends State<CodeBlock>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   late final Animation<double> _slideEditor;
//   @override
//   void initState() {
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 300),
//       vsync: this,
//     )..forward();
//     _slideEditor = Tween<double>(
//       begin: 0,
//       end: -20,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return <Widget>[
//       AnimatedBuilder(
//         builder: (context, child) {
//           return Positioned(
//             left: _slideEditor.value,
//             top: _slideEditor.value,
//             child: child!,
//           );
//         },
//         animation: _slideEditor,
//         child: Opacity(
//             opacity: 0.4,
//             child: Editor(
//               isBackground: true,
//             )),
//       ),
//       Editor(),
//     ].addStack();
//   }
// }

// class Editor extends StatelessWidget {
//   Editor({
//     Key? key,
//     this.isBackground = false,
//   }) : super(key: key);
//   final bool isBackground;
//   final btnColors = [
//     Colors.amber,
//     Colors.green,
//     Colors.red,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: 250,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         border: Border.all(
//           width: 1,
//           color: Colors.black12,
//         ),
//         color: Colors.black,
//       ),
//       padding: const EdgeInsets.all(12.0),
//       margin: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
//       child: isBackground
//           ? null
//           : <Widget>[
//               <Widget>[
//                 ...btnColors.map(
//                   (color) {
//                     return Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.circle,
//                           size: 14,
//                           color: color,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                       ],
//                     );
//                   },
//                 ).toList(),
//               ]
//                   .addRow(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                   )
//                   .addAlign(
//                     alignment: Alignment.topRight,
//                   ),
//               Type.Ri(
//                 text: TextSpan(
//                   text: '\$ find / name -"life.dart"\n\n',
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: kWhite,
//                       ),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: '> Searching . . .\n\n',
//                       style: TextStyle(
//                         color: kSecondary,
//                       ),
//                     ),
//                     const TextSpan(
//                       text: '> Error: No life is found!\n\n',
//                       style: TextStyle(
//                         color: kRed,
//                       ),
//                     ),
//                     const TextSpan(
//                       text: "> Since you are a programmer, you have no life!",
//                       style: TextStyle(
//                         color: kRed,
//                       ),
//                     ),
//                   ],
//                 ),
//                 duration: duration5000,
//               ),
//             ].addColumn(
//               crossAxisAlignment: CrossAxisAlignment.start,
//             ),
//     );
//   }
// }
