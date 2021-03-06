#import "ViewController.h"
#import "CCCalculator.h"

@interface ViewController () {
    BOOL shouldClear;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    shouldClear = false;
    [_textField setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSString *textFieldText;
    
    if (shouldClear) {
        _textField.text = @"";
        shouldClear = !shouldClear;
    }
    
    switch (sender.tag) {
        case ADD:
        {            
            if ([[[self textField] text] rangeOfString:@"+"].length > 0) {
                return;
            }
            
            textFieldText = [NSString stringWithFormat:@"%@+", [[self textField] text]];
            break;
        }
        case ANSWER:
            textFieldText = [CCCalculator resultsFor:[[self textField] text]];
            shouldClear = !shouldClear;
            break;
        default:
            textFieldText = [NSString stringWithFormat:@"%@%lu", [[self textField] text], sender.tag];
            break;
    }
    
    [_textField setText:textFieldText];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return true;
}

@end
