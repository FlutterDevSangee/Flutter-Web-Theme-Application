// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PaletteState(),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Theme App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor:
                    context.watch<PaletteState>().selectedPalette.primaryColor,
                primary:
                    context.watch<PaletteState>().selectedPalette.primaryColor,
                secondary: context
                    .watch<PaletteState>()
                    .selectedPalette
                    .secondaryColor,
              ),
              useMaterial3: true,
            ),
            home: const HomePage(),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ]),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(20.0),
            height: 100.0,
            width: 620.0,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: OverflowBox(
              minHeight: 80.0,
              maxHeight: 160.0,
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Consumer<PaletteState>(
                      builder: (context, PaletteState paletteState, child) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: paletteState.availablePalette
                            .map<Widget>((palette) {
                          return GestureDetector(
                            onTap: () {
                              paletteState.changeSelectedPalette(palette);
                            },
                            child: MouseRegion(
                              onEnter: (value) {
                                paletteState.changeHoveredPalette(palette);
                              },
                              onExit: (value) {
                                paletteState.changeHoveredPalette(null);
                              },
                              child: SizedBox(
                                height: 180.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 375),
                                      curve: Curves.ease,
                                      height: paletteState.hoveredPalette ==
                                              palette
                                          ? 100.0
                                          : paletteState.hoveredPalette == null
                                              ? 50.0
                                              : (paletteState.hoveredPalette!
                                                              .index ==
                                                          palette.index - 1 ||
                                                      paletteState
                                                              .hoveredPalette!
                                                              .index ==
                                                          palette.index + 1)
                                                  ? 70.0
                                                  : 50.0,
                                      width: paletteState.hoveredPalette ==
                                              palette
                                          ? 100.0
                                          : paletteState.hoveredPalette == null
                                              ? 50.0
                                              : (paletteState.hoveredPalette!
                                                              .index ==
                                                          palette.index - 1 ||
                                                      paletteState
                                                              .hoveredPalette!
                                                              .index ==
                                                          palette.index + 1)
                                                  ? 70.0
                                                  : 50.0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              paletteState.hoveredPalette ==
                                                      palette
                                                  ? 15.0
                                                  : 5.0,
                                          vertical: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            palette.primaryColor,
                                            palette.secondaryColor,
                                          ],
                                        ),
                                        border: Border.all(
                                          color: Colors.white70,
                                          width: 3.0,
                                        ),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 375),
                                      curve: Curves.ease,
                                      margin: EdgeInsets.only(
                                          top: paletteState.hoveredPalette ==
                                                  palette
                                              ? 40.0
                                              : paletteState.hoveredPalette ==
                                                      null
                                                  ? 5.0
                                                  : (paletteState.hoveredPalette!
                                                                  .index ==
                                                              palette.index -
                                                                  1 ||
                                                          paletteState
                                                                  .hoveredPalette!
                                                                  .index ==
                                                              palette.index + 1)
                                                      ? 20.0
                                                      : 5.0),
                                      height: 5.0,
                                      width: 5.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
