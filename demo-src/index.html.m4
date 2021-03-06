TITLE(`Make and M4 Static Website Generator')
DATE(`Thu, 28 Feb 2013 18:27:11 -0500')

<p><img style="margin: 10px 5% 10px 5%; max-width: 40%;" class="pull-right" src="http://placekitten.com/400/400" /><b>m4-bakery</b> is a <i>Makefile</i> that builds a static website from various sources, using the venerable UNIX tools <tt><a href="https://www.gnu.org/software/make/">GNU make</a></tt> and optionally <tt><a href="https://www.gnu.org/software/m4/">GNU m4</a></tt>. It is carefully crafted to be modular, allowing it to be customized to adapt to your preferences.</p>

<p>A <i>static</i> website is one which requires no special logic on the server-side to work, as opposed to <i>dynamic</i> websites which incur some processing overhead on the server-side for most page requests. Static websites are useful because they're effortlessly fast, scalable, and cache-able. Compared to dynamic sites, static sites are much easier to secure, and can be served from the very cheapest of hosting services.</p>

<p><tt>GNU Make</tt> is a tool that takes as input a description of how compilation tools operate and a collection of files to be created, and figures out which commands need to be run, in what order, and on which source files, to compile those source files into their corresponding targets. When invoked multiple times it is smart enough to only recompile target files whose source files have changed. When used on multi-core systems or with I/O heavy jobs it is smart enough to figure out how to parallelize its work. Originally created for compilation of source code into executable code, I use to compile various source formats into an HTML website. Modern work-alikes include <a href="gruntjs.com">Grunt</a>, <a href="http://rake.rubyforge.org">Rake</a>, or <a href="http://ant.apache.org">Ant</a>. Despite its age and the number of times it has been re-invented, <tt>GNU Make</tt> has some surprising features that I think makes it superior to the newcomers.</p>

<p><tt>GNU M4</tt> is a <i>macro processor</i> which I employ as a minimalist templating engine. In the past, it formed the core of this software, but now thanks to a <i>plug-in</i>-style configuration for <tt>GNU Make</tt>, it is one of many template compilation options that may easily be toggled on or off. Perhaps this project should be renamed to <i>make-bakery</i>.</p>

<p>Both <tt>Make</tt> and <tt>M4</tt> have a rather steep learning curve, but since they are so ubiquitous, it's likely that they're already installed on your computer, and your web host's servers.</p>

<p>I show in the demonstration site source code how one might wire up their favorite plain-text-to-html compiler to <tt>GNU Make</tt>. I recommend <a href="http://johnmacfarlane.net/pandoc/">Pandoc</a>, which lets you can keep all your source files in markdown format. You could similarly replace <tt>m4</tt> with a modern templating engine like <a href="http://jinja.pocoo.org/">Jinja</a>, or add CSS compilers like <a href="http://lesscss.org/">LESS</a>, image processing using <a href="http://www.imagemagick.org">ImageMagick</a>, and any other custom scripts you please to the compilation pipeline.</p>

<p>This website is the result of running <code>make</code> in the <code>m4-bakery</code> repository, which compiles the included demo site source to HTML.</p>

<p>The source code for this demo site is included with m4-bakery in the <code>demo-src</code> directory. Visit <a href="https://github.com/datagrok/m4-bakery">the m4-bakery project page on GitHub</a> to learn more.</p>

<h2>Interesting features</h2>

<p>Static page-compiling tools are fairly boring, but there are some clever pieces within m4-bakery:</p>

<ul>
<li>Unlike in many other projects, I try to remain language-agnostic. Users who want to build upon these techniques should be able to find this project useful regardless of whether they prefer Ruby, Python, Perl, Bash, C or anything else.</li>
<li>Unlike many other templating schemes, I try to avoid any boilerplate in source files. Page templates are not "included" from sources; instead all sources get a template wrapped around them. This was somewhat tricky to accomplish with <tt>M4</tt>.</li>
<li>The included demo is a responsive site that uses <a href="http://getbootstrap.com">Twitter Bootstrap</a>.</li>
<li>Pages are compiled in a pipeline according to their filename extension. You may freely mix markdown, raw html, compile-time executables, and other files within your sources. Also, you may chain them together, so that for example a python script might retrieve information from a database and render markdown, which is then rendered into html.</li>
<li><code>demo-src/pages.json.m4.index</code> renders <a href="pages.json">a .json index of all the pages on the site</a>. This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will <i>automatically be rebuilt whenever pages are added or removed</i>.
<li><code>demo-src/atom.xml.m4.index</code> renders <a href="atom.xml">an atom-format .xml file</a> of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
<li><tt>GNU make</tt> has built-in support for multiprocessing. With one command-line option it will take full advantage of multi-core and multi-processor machines to compile pages in parallel.
<li>I have recently implemented most features as a system of <tt>GNU Make</tt>-based <i>plug-ins</i> around a small core Makefile. Easily toggle between the features you prefer, disable the ones you don't use to save speed, or build your own without having to modify the entire system.</li>
</ul>

<h2>Coming soon</h2>

<ul>
<li>Example of how to automatically build a blog from a collection of posts, with RSS and ATOM feeds.</li>
<li>Example of how to automatically build a breadcrumbs bar.</li>
<li>Example of how to automatically build a <a href="http://www.sitemaps.org">sitemap</a>.</li>
<li>Example of how to automatically compile Twitter Bootstrap CSS from its LESS or SASS sources.</li>
<li>Example of a static AJAX-based application, its static backend, and the <a href="https://developers.google.com/webmasters/ajax-crawling/docs/learn-more">HTML Snapshot needed for non-JavaScript browsers and web-crawlers to index it</a>.
</ul>

<p>Created by <a href="http://datagrok.org">Michael F. Lamb</a>. License: <a href="https://www.gnu.org/licenses/agpl-3.0.html">Affero GPL version 3 or later</a>.</p>
