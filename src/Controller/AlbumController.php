<?php

namespace App\Controller;

use App\Entity\Album;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AlbumController extends AbstractController
{
    #[Route('/album', name: 'album')]
    public function index(): Response
    {

        $album =$this->getDoctrine()
            ->getRepository(Album::class)
            ->findAll();        

        return $this->render('album/index.html.twig', [
            'controller_name' => 'AlbumController',
            'album' => $album,
        ]);
    }
}