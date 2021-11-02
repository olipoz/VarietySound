<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PlaylistController extends AbstractController
{
    /**
     * @route ("/playlist", name="playlist")
     *
     * @return Response
     */
    public function index(): Response
    {
        $user = $this->getUser();
        $playlist = $user
        ->getMusics();
        return $this->render('playlist/index.html.twig', [
            //'controller_name' => 'PlaylistController',
            'playlist'=>$playlist,

        ]);
    }
}
