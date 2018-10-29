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

void setup() {
  size(1024, 780);
  background(255);
  img = loadImage("pic.png");
  image(img,0,100);
}

void draw() {
  int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = int(x1 + random(-7, 7));
  int y2 = int(random(-5, 5));

  int w = (int) random(35, 50);
  int h = height;

  copy(x1,y1, w,h, x2,y2, w,h);
}
