#!/usr/bin/env node

const childProcess = require('child_process');
// This will list all the themes installed, including visible name and ID
const themesOutput = childProcess.execSync('dconf dump /org/gnome/terminal/legacy/profiles:/').toString();

const defaultTheme = process.argv[2];
if (!defaultTheme) throw new Error('No default theme provided, please provide the arg eg: ./defaultTheme "Dark Pastel"');

let themeId = null;

// Parse the themesOutput to get the themeId with the theme name
const blocks = themesOutput.split('[:');
for (let index = 0; index < blocks.length; index++) {
  if (blocks[index].includes(defaultTheme)) {
    const lines = blocks[index].split('\n');
    console.log(lines);
    themeId = lines[0].replace(']', '');
  }

}

if (themeId) {
    childProcess.execSync(`dconf write /org/gnome/terminal/legacy/profiles:/default "'${themeId}'"`);
} else {
  console.error("Unable to find the id for: " + defaultTheme)
  /* throw new Error("Unable to find theme id for: "+ defaultTheme) */
}
