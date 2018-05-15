# saveMapPosition

This plugin saves map coordinates (lat/long) into two standard elements.  
It is designed to act as the receiving part of a webservice or s.th. of that kind that
retrieves these data from google maps or any other geolocation service (not included).

## Installation

### Installation on the server

Copy the "saveMapPosition" folder into the "plugins" folder of your CMS installation.  
It is not necessary to import the plugin to the Server Manager.

## How to use

The plugin is designed to receive the following parameters via an AJAX call using the POST method:

### Parameters

| name                 | description                               |
| -------------------- | ----------------------------------------- |
| sessionkey           | Current sessionkey                        |
| loginguid            | Current login guid                        |
| pageguid             | Guid of the current page                  |
| saveMapPositionX     | Lat value to be saved                     |
| saveMapPositionY     | Long value to be saved                    |
| saveEltTemplateNameX | Template element name of the lat element  |
| saveEltTemplateNameY | Template element name of the long element |

### Return value

The plugin only saves ther given values into the given elements. Due to the standard WSM
workflow, the page is changed and therefore becomes a new Draft.

The plugin returns "ok" when the values were successfully saved. There is no further error handling.

## License and exclusion of liability

This software is licensed under a [Creative Commons GNU General Public License](http://creativecommons.org/licenses/GPL/2.0/). Some rights reserved.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but **without any warranty**; without even the implied warranty of **merchantability** or **fitness for a particular purpose**. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with TemplateDependenceChecker.  If not, see http://www.gnu.org/licenses.

The GNU General Public License is a Free Software license. Like any Free Software license, it grants to you the four following freedoms:

0. The freedom to run the program for any purpose.
1. The freedom to study how the program works and adapt it to your needs.
2. The freedom to redistribute copies so you can help your neighbor.
3. The freedom to improve the program and release your improvements to the public, so that the whole community benefits.

You may exercise the freedoms specified here provided that you comply with the express conditions of this license. The principal conditions are:

- You must conspicuously and appropriately publish on each copy distributed an appropriate copyright notice and disclaimer of warranty and keep intact all the notices that refer to this License and to the absence of any warranty; and give any other recipients of the Program a copy of the GNU General Public License along with the Program. Any translation of the GNU General Public License must be accompanied by the GNU General Public License.
- If you modify your copy or copies of the program or any portion of it, or develop a program based upon it, you may distribute the resulting work provided you do so under the GNU General Public License. Any translation of the GNU General Public License must be accompanied by the GNU General Public License.
- If you copy or distribute the program, you must accompany it with the complete corresponding machine-readable source code or with a written offer, valid for at least three years, to furnish the complete corresponding machine-readable source code.

Any of the above conditions can be waived if you get permission from the copyright holder.
