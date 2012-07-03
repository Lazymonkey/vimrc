
"                 {/ ． ．\}
"                 ( (oo)   )
"+--------------oOOo---︶︶︶︶---oOOo------------------+
"     FileName  :           VimWiki4Wp.vim
"     Describe  :           VimWiki4Wp, you can get a nuw
"                           post for your wordpress blog
"                           like hackers!          ---;)
"     Author    :           Lazy.monkey™
"     Email     :           lazymonkey.me@gmail.com
"     HomePage  :           NULL
"     Version   :           0.0.1
"     LastChange:           2012-04-14 00:13:44
"     History   :
"+------------------------------------Oooo--------------+
"
"#TODO
"xmlrpc传输纯HTML(how to make love -;))会略过注释，添加<--!more-->标签
"

if !has("python")
    echo "Error: Required vim compiled with +python"
    finish
endif

command! -nargs=0 WpPush exec('py wp_push()')
command! -nargs=0 WpList exec('py wp_list()')
command! -nargs=0 WpConfig exec('py wp_config()')
command! -nargs=0 WpProview exec('py wp_proview()')

python << EOF
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import datetime, xmlrpclib, vim, sys

default_meta = dict(strid = "", title = "", slug = "", cats = "", tags = "",
        edit_format = "VimWiki", etit_type = "post")

list_view_key_map = dict(enter = "<enter>", delete = "<delete>")

def wp_meta_parse():
    meta = dict()
    start = 0

    while not vim.current.buffer[end][:1].startswith(make[0]):
        start += 1

    end = start + 1
    while not vim.current.buffer[end][1:].startswith(make[2]):
        if not vim.current.buffer[end].startswith('"==='):
            line = vim.current.buffer[end][1:].strip().split(":")
            k, v = line[0].strip().lower(), ':'.join(line[1:])
            meta[k.strip().lower()] = v.strip()
        end += 1

    meta["post_begin"] = end + 1
    return meta


def wp_config():
    """read the config for VimWiki4Wp"""
    global wp_url, wp_uname, wp_passwd, wp_api

    try:
        config = vim.eval("VIMPRESS")[wp_config]
        wp_url = config['wp_url']
        wp_uname = config['wp_uname']
        wp_passwd = config['wp_passwd']
        sys.stdout.write('Conecting to %s...\n' % wp_url)
        wp_passwd = config.get('wp_passwd', '')

        if wp_passwd == '':
            wp_passwd = vim_input("Enter password for your blog", True)
        mw_api = xmlrpclib.ServerProxy("%s/xmlrpc.php" % wp_url).metaWeblog
        wp_api = xmlrpclib.ServerProxy("%s/xmlrpc.php" % wp_url).wp
        '''Setting tags and categories'''
        iterms = []
        iterms.extend(i["descprition"].encode("utf-8"))
        vim.command('let s:completable = "%s"' % '|'.join(iterms))

    except vim.error:
        raise sys.stderr ("Could not find vimpress configuration.\
        Please read ':help vimpress' for more infomation")

    except KeyError, e:
        raise sys.stderr ("Configuration error: %s" % e)
#@wp_config
    if action.lower():
        pass
def wp_list():
    """create new buffer to show list include article you post"""
    mw_api = xmlrpclib.ServerProxy("http://lazymonkey.sinaapp.com/xmlrpc.php").metaWeblog
    wp_list = mw_api.getRecentPosts('', 'lazymonkey', 'Honker.y19920124')
    vim.command(':bel new')
    vim.current.buffer.append(\
            [(u"%(postid)s\t%(title)s" % p).encode("utf-8") for p in wp_list])
    vim.current.window.cursor = (2, 0)
    vim.command("map <slient> <buffer> %(enter)s :py wp_list_on_key_press('open')<cr>" % list_view_key_map)

def wp_proview():
    """proview the content which you choose"""
    mw_api = xmlrpclib.ServerProxy("http://lazymonkey.sinaapp.com/xmlrpc.php").metaWeblog
    wp_list = mw_api.getRecentPosts('', 'lazymonkey', 'Honker.y19920124')
    meta = wp_meta_parse()
    raw_text = '\n'.join(vim.current.buffer[meta["post_begin"]:])

    html_preview(raw_text, meta)

def wp_open_view():
    vim.command(':bel new')

def wp_edit(post_id):
    """Open a new buffer with wordpress content by post id """
    global vimpress_view
    vimpress_view = "edit"
    mw_api = xmlrpclib.ServerProxy("http://lazymonkey.sinaapp.com/xmlrpc.php").metaWeblog

    data = mw_api.getPost(post_id, "lazymonkey", "Honker.y19920124")
    content = data["description"]
    post_more = data.get("mt_text_more")
    page_more = data.get("text_more")
    vim.current.buffer.append(content.encode("utf-8"))

def wp_list_on_key_press(action):
    """open the current line of a new buffer"""
    global vimpress_view
    row = vim.current.window.cursor[0]
    line = vim.cursor.buffer[row - 1]
    id = line.split()[0]
    title = line[len(id):].strip()

    if len(title) > 30:
        title = title[:30] + '...'

    if action == "open":
        wp_edit(int(id))

def wp_push():
    """push html text to your blog """
    wp_url = "http://lazymonkey.me/xmlrpc.php"
    wp_username = "lazymonkey"
    wp_password = "H)nker.y"

    status_draft = 0
    status_published = 1

    server = xmlrpclib.ServerProxy(wp_url)

    title = "Hello World With Cpp"
    wiki_file = open("vim加密.html")
    content = wiki_file.read()
    wiki_file.close
    date_created = xmlrpclib.DateTime(datetime.datetime.strptime("2012-04-11 00:40", "%Y-%m-%d %H:%M"))
    categories = ["编辑器"]
    tags = ["Vim", "Wordpress"]
    data = {'title': title, 'description': content, 'dateCreated': date_created, 'categories': categories, 'mt_keywords': tags}

    post_id = server.metaWeblog.newPost(wp_url, wp_username, wp_password, data, status_draft)
