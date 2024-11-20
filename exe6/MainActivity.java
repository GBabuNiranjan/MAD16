package com.example.exe05;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
public class MainActivity extends AppCompatActivity {
private TextToSpeechHelper textToSpeechHelper;
private SpeechToTextHelper speechToTextHelper;
private EditText editText;
@Override protected void onCreate(Bundle 
savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);
editText = findViewById(R.id.editText);
Button buttonSpeak = findViewById(R.id.buttonSpeak);
Button buttonListen = findViewById(R.id.buttonListen);
Button buttonClear = findViewById(R.id.buttonClear);
textToSpeechHelper = new TextToSpeechHelper();
textToSpeechHelper.initTextToSpeech(this);
speechToTextHelper = new SpeechToTextHelper();
speechToTextHelper.initSpeechToText(this);
speechToTextHelper.setOnSpeechRecognitionListener(r
ecognizedText -> {
editText.setText(recognizedText);
textToSpeechHelper.speakText("You said: " + 
recognizedText); });
buttonSpeak.setOnClickListener(v -> {
String text = editText.getText().toString();
if (!text.isEmpty()) {
textToSpeechHelper.speakText(text);
} else {
Toast.makeText(MainActivity.this, "Please enter text to 
speak", Toast.LENGTH_SHORT).show();} });
buttonListen.setOnClickListener(v -> {
speechToTextHelper.startSpeechRecognition();});
buttonClear.setOnClickListener(v -> {
editText.setText(""); // Clear the EditText
Toast.makeText(MainActivity.this, "Text cleared", 
Toast.LENGTH_SHORT).show();});}
@Override ,protected void onDestroy() {
super.onDestroy();
textToSpeechHelper.shutdown();
speechToTextHelper.shutdown(); ,}}
