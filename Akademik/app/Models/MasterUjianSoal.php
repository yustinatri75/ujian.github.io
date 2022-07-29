<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class MasterUjianSoal
 * 
 * @property int $id
 * @property string|null $soal
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class MasterUjianSoal extends Model
{
	protected $table = 'master_ujian_soal';

	protected $fillable = [
		'soal'
	];
}
