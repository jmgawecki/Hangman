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
    printf("\nWord: ");
    
    // this will be used to track missing letters
    BOOL missingLetters = NO;
    
    // loop over every letter
    for (NSInteger i = 0; i < [word length]; i++) {
        // convert the unichar into an NSString for arrays
        // conversion to unichar is needed cause it would not work with NSStrings directly
        unichar letter = [word characterAtIndex:i];
        NSString *letterString = [NSString stringWithFormat:@"%C", letter];
        
        // if we already guessed this letter, print it out
        if ([usedLetters containsObject:letterString]) {
            printf("%C", letter);
        } else {
            printf("_");
            // we haven't found all the letters just yet if we print underscore so set the missingLetters to YES
            missingLetters = YES;
        }
    }
    
    if (missingLetters == NO) {
        // no missing letters so its a win!
        printf("\nCongratulations! You've won the game!\n");
        exit(0);
    } else {
        if ([usedLetters count] == 8) {
            printf("Oops! You died, hehe..\n");
            exit(0);
        } else {
            printf("\nEnter a guess: ");
        }
    }
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
                // pull out the first letter from the input
                unichar letter = [input characterAtIndex:0];
                
                // convert it to an uppercase NSString
                NSString *letterString = [[NSString stringWithFormat:@"%C", letter] uppercaseString];
                
                if ([usedLetters containsObject:letterString]) {
                    printf("You used that letter already!\n");
                } else {
                    [usedLetters addObject:letterString];
                }
            }
            
            // no matter what, print the game state again
            printWord(word, usedLetters);
        }
    }
    return 0;
}
