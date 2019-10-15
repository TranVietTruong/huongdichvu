<?php
  include 'simple_html_dom.php';

//thêm slug
//thêm thẻ chứa content lưu ở ô postBy // div.reading-content

function crawl_brandsvietnam($url) {

  $iddanhmuc = 1;
  $post = file_get_html($url);
  // echo $post;
  if($post != '')
  {
    //xử lý link ảnh

    $image = $post->find('div.m-b img',0)->src;
    $image_explode = explode("/", $image);
    $hasDomain = false;

    for($i = count($image_explode)-1; $i>=0; $i--)
    {
      if($image_explode[$i]=="www.brandsvietnam.com")
      {
        $hasDomain = true;
        break;
      }
    }

    if($hasDomain)
    {
      $image = $post->find('div.img-effect img',0)->src;
      $image_explode2 = explode("/", $image);

      array_shift($image_explode2);
      array_shift($image_explode2);

      $image_explode2 = join("/",$image_explode2);
      $image = $image_explode2;
      $image = "https://www.brandsvietnam.com/" . $image;
    }
    else {
      $image = "https://www.brandsvietnam.com/" . $image;
    }

    $image_explode = explode("/", $image);

    for($i=count($image_explode)-1; $i>=0; $i--)
    {
      if($image_explode[$i]=="400px" || $image_explode[$i] == "480px")
      {
          $image_explode[$i] = "200px";
          break;
      }
    }
    $image = join("/",$image_explode);

    // xử lý tiêu đề
    $title = $post->find('h1.m-t-none',0)->plaintext;
    $title = explode(" ",$title);
    for($i = count($title)-1; $i>=0; $i--)
    {
      $title[$i] = trim($title[$i]);
      if($title[$i]=='Lưu')
      {
        $title[$i] = '';
        break;
      }
    }

    $title = join(" ", $title);
    ///////////////////

    $data = array(
      addslashes(trim($title)), //title
      $image, // image)
      $url); // link

    // add slug
    $link_explode = explode("/", $data[2]);
    $index_slug = count($link_explode)-1;
    array_push($data, $link_explode[$index_slug]);

    $sql = "INSERT INTO `news` (`id`, `id_category`, `title`, `image`, `content`, `slug`, `post_by`) VALUES (NULL, '$iddanhmuc', '$data[0]', '$data[1]', '$data[2]', '$data[3]', ' div.reading-content');";
    return $sql;
  }
  else{
    return 'Page not exist';
  }
}
