//
//  main.m
//  Hangman
//
//  Created by Jakub Gawecki on 26/04/2021.
//

#import <Foundation/Foundation.h>
// We are going to use this function to print the current state of the game
// We have to place it before main because we dont have a header file where we can declare
// This part works exactly as in High School with C++. Functions above the main
void printWord(NSString *word, NSMutableArray<NSString*> *usedLetters) {
    // code to go here
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *word = @"RHYTHM";
        NSMutableArray<NSString*> *usedLetters = [NSMutableArray arrayWithCapacity:8];
        
        printf("Welcome to Hangman!\n");
        printf("Press a letter to guess, or Ctrl+C to quit\n");
        printWord(word, usedLetters);
        
        // 1 is always 1 so the loop will go forever
        while (1) {
            // read a string from the user
            char cstring[256];
            scanf("%s", cstring);
            
            // convert it to NSString
            NSString *input = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
            
            if ([input length] != 1) {
                printf("Please type exactly one letter, or Ctrl+C to quit.");
            } else {
                // this letter is new!
            }
            
            // no matter what, print the game state again
            printWord(word, usedLetters);
        }
    }
    return 0;
}
