import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class WidgetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Widgets',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32,
          children: [
            const SizedBox(height: 8),
            _section(
              'Text',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text('Vanlig tekst'),
                  Text('Stor overskrift', style: Theme.of(context).textTheme.headlineMedium),
                  Text(
                    'Med stil',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  Text(
                    'Denne teksten er veldig lang og vil automatisk bryte til neste linje når den ikke får plass.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            _section(
              'Icon',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.star, color: Colors.amber, size: 36),
                  Icon(Icons.favorite, color: Colors.red),
                  Icon(Icons.settings, color: Colors.grey),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            _section(
              'Image',
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://www.knowit.no/contentassets/ccd9861f69b54a3887026bffc3af8981/fasade.jpg',
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return SizedBox(
                      height: 160,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ),
            _section(
              'TextField',
              TextField(
                decoration: InputDecoration(
                  labelText: 'Skriv noe her',
                  hintText: 'Hint-tekst',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
            ),
            _section(
              'OutlinedButton',
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('Standard')),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Med ikon'),
                  ),
                  OutlinedButton(onPressed: null, child: Text('Deaktivert')),
                ],
              ),
            ),
            _section(
              'CircularProgressIndicator',
              Row(
                spacing: 24,
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      CircularProgressIndicator(),
                      Text('Ubestemt', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      CircularProgressIndicator(value: 0.7),
                      Text('70%', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      Switch(
                        value: true,
                        onChanged: (value) {
                          print("Use the new value for something");
                        },
                      ),
                      Text(
                        'Toggle',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(title, style: TextStyle(fontSize: 24)),
        content,
      ],
    );
  }
}
