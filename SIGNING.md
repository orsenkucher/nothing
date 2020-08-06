When running `flutter run --release` this error can occur
```
FAILURE: Build failed with an exception.                                
                                                                        
* What went wrong:                                                      
Execution failed for task ':app:validateSigningRelease'.                
> Keystore file not set for signing config release  
```

This means signing key is missing.  
To fix it create `nothing/android/key.secret.properties` file
```
storePassword=MYPASSWORD
keyPassword=MYPASSWORD
keyAlias=key
storeFile=path/to/key.jks
```
You also have to have `key.jks` file somewhere on your work system.

Now `flutter run --release` should work!
