import 'package:flutter/material.dart';
import 'package:travel_expenses/widgets/expenses.dart';

var myLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 93, 89, 159),
);

var myDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: myDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),   
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.primaryContainer,
          ),
          headlineSmall: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: myDarkColorScheme.onPrimaryContainer, //changed this to Dark Colour Theme after the video
          ),
        )
      ),
      theme: ThemeData().copyWith(
        colorScheme: myLightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myLightColorScheme.onPrimaryContainer,
          foregroundColor: myLightColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myLightColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),   
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myLightColorScheme.onSecondaryContainer,
            foregroundColor: myLightColorScheme.secondaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: myLightColorScheme.primaryContainer,
          ),
          headlineSmall: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: myLightColorScheme.onPrimaryContainer,
          ),
        ),
        dialogTheme: const DialogTheme().copyWith(
          backgroundColor: myLightColorScheme.surface,
          contentTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: myLightColorScheme.surfaceTint,
          )
        )
      ),
      home: const Expenses(),
    ),
  );
}
