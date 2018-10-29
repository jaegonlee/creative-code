// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

PImage img;

int w;
int h;

void setup() {
  size(1600, 1200); 
  img = loadImage("image.jpg");
  w = 160;
  h = 120;
}

void draw() {
  int i = 0;
  for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
      copy(img, x*w, y*h, w, h, x*w, y*h, w, h);
      i++;
    }
  }
}
